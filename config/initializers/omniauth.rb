Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :client_options => {:ssl => {:verify => false}},
          :scope => 'email,friends_birthday,friends_relationship_status,friends_statuses'
end