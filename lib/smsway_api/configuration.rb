require 'logger'

module SmswayApi
  # General configuration module.
  #
  # @note `SmswayApi::Configuration` extends `Smsway` so these methods should be called from the latter.
  module Configuration
    # Available options.
    OPTION_NAMES = [
      :login,
      :password,
      :logger,
      :log_requests,
      :log_errors,
      :log_responses
    ]

    attr_accessor *OPTION_NAMES

    alias_method :log_requests?,  :log_requests
    alias_method :log_errors?,    :log_errors
    alias_method :log_responses?, :log_responses

    # Default max retries count.
    DEFAULT_MAX_RETRIES = 2

    # Logger default options.
    DEFAULT_LOGGER_OPTIONS = {
      requests:  true,
      errors:    true,
      responses: false
    }

    # A global configuration set via the block.
    # @example
    #   SmswayApi.configure do |config|
    #     config.adapter = :net_http
    #     config.logger  = Rails.logger
    #   end
    def configure
      yield self if block_given?
      self
    end

    # Reset all configuration options to defaults.
    def reset
      @max_retries     = DEFAULT_MAX_RETRIES
      @logger          = ::Logger.new(STDOUT)
      @log_requests    = DEFAULT_LOGGER_OPTIONS[:requests]
      @log_errors      = DEFAULT_LOGGER_OPTIONS[:errors]
      @log_responses   = DEFAULT_LOGGER_OPTIONS[:responses]
    end

    # When this module is extended, set all configuration options to their default values.
    def self.extended(base)
      base.reset
    end
  end
end