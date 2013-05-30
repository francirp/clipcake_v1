Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday,user_photos,friends_photos,friends_birthday', :display => 'popup', :secure_image_url => true
end
