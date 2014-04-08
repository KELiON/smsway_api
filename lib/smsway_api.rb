require 'builder'

require 'smsway_api/configuration.rb'
require 'smsway_api/api.rb'
require 'smsway_api/message.rb'
require 'smsway_api/message/sms.rb'
require 'smsway_api/message/vcard.rb'
require 'smsway_api/message/wap_push.rb'

module SmswayApi
  extend SmswayApi::Configuration
end
