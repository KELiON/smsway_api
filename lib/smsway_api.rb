require 'builder'

require 'smsway_api/configuration.rb'
require 'smsway_api/api.rb'
require 'smsway_api/message.rb'
require 'smsway_api/method.rb'
require 'smsway_api/message/sms.rb'
require 'smsway_api/message/vcard.rb'
require 'smsway_api/message/wap_push.rb'
require 'smsway_api/method/send_message.rb'
require 'smsway_api/method/balance.rb'

module SmswayApi
  extend SmswayApi::Configuration
end
