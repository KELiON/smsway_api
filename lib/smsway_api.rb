require 'builder'

require './lib/smsway_api/configuration.rb'
require './lib/smsway_api/api.rb'
require './lib/smsway_api/message.rb'
require './lib/smsway_api/message/sms.rb'
require './lib/smsway_api/message/vcard.rb'
require './lib/smsway_api/message/wap_push.rb'

module SmswayApi
  extend SmswayApi::Configuration
end
