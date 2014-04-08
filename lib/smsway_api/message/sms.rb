module SmswayApi
  class Message::Sms < Message
    attr_accessor :message

    def initialize(sender = nil, message= nil)
      super(:sms)
      @sender = sender
      @message = message
    end

    def build(xml)
      super do |xml|
        xml.text @message
      end
    end
  end
end