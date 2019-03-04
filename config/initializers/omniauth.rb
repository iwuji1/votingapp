Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_API_ID"], ENV["GOOGLE_API_KEY"], skip_jwt: true
end
