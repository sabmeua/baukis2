Rails.application.configure do
  config.hosts << "example.com"
  config.hosts << "baukis2.example.com"
  # @note Set as "config.hosts << nil" when it doesn't need any restriction by host name.
end
