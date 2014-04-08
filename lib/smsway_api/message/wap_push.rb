module SmswayApi
  class Message::WapPush < Message
    attr_accessor :url

    def initialize(sender = nil, url = nil)
      super(:wappush)
      @url = url
    end

    def build(xml)
      super do |xml|
        xml.url @url
      end
    end
  end
end