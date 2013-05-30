class Facebook < ActiveRecord::Base
  attr_accessible :access_token, :access_token_expires_at, :provider, :uid, :user_id
belongs_to :user

end
