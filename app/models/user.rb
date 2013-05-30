class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :password, :password_confirmation

  validates :email, :uniqueness => true

  has_secure_password

  def self.from_omniauth(auth)
    Facebook.where(auth.slice("provider", "uid")).first.try(:user) || where(auth.slice("email")).first.try(:add_facebook_login, auth) || create_from_omniauth(auth)
  end

  def add_facebook_login(auth)
    if @user.present?
      user = @user
    else
      user = self
    end

    f = Facebook.new
      f.user_id = user.id
      f.uid = auth.uid
      f.provider = auth.provider
      f.access_token = auth.credentials.token
      f.access_token_expires_at = auth.credentials.expires_at
      f.save

    return user
  end

  def self.create_from_omniauth(auth)

    create! do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      @user = user
    end

    @user.add_facebook_login(auth)
  end

end
