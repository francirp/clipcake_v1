class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :password, :password_confirmation

  validates :email, :uniqueness => true

  has_secure_password


#------------------ OMNIAUTH HANDLER------------------------
  #FROM THE SESSIONS CONTROLLER - HANDLES LOGIN/SIGNUP FROM OMNIAUTH
  def self.from_omniauth(auth)
    Facebook.where(auth.slice("provider", "uid")).first.try(:user) || where(auth.slice("email")).first.try(:add_facebook_login, auth) || create_from_omniauth(auth)
  end
#-----------------------------------------------------------


#------------------ OMNIAUTH CREATE NEW USER----------------
  #THIS IS FOR ADDING A NEW USER TO THE USER TABLE AND WILL ONLY FIRE IF:
    # 1. The user has not logged in via Facebook on our app before (i.e. their Facebook UID is not in the Facebook table)
    # 2. The user's email (as provided by Facebook) does not match any email that is in our User table.

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
#-----------------------------------------------------------


#-------------OMNIAUTH ADD FACEBOOK AUTHORIZATION-----------
  #THIS IS FOR ADDING FACEBOOK INFORMATION TO FACEBOOK TABLE FOR THE FOLLOWING CIRCUMSTANCES:
    # 1. The user is new
    # 2. The user created a local account with us and is now trying to integrate his/her account with Facebook
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
#-----------------------------------------------------------

