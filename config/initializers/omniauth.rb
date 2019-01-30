OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1052282545216-c7nkf1i9e4cev5pf2u7joceha7kvgbd5.apps.googleusercontent.com', 'kXTFIklv93K7yRpLAF3o4vli', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
