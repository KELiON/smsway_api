module SmswayApi
  class Message::Sms < Message
    attr_accessor :message

    def initialize(message= nil)
      super(:sms)
      @message = message
    end

    def build(xml, start_index = 0)
      super do |xml|
        xml.text @message
      end
    end
  end
end