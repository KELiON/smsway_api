SmswayApi.configure do |config|
  # Authorization parameters
  # config.login = '123'
  # config.password = 'AbCdE654'

  # set this to have persistent sender through your application
  # config.default_sender = 'SMSWAY'

  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger

  # log requests' URLs
  # config.log_requests = true

  # log response JSON after errors
  # config.log_errors = true

  # log response JSON after successful responses
  # config.log_responses = false
end