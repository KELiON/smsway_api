module SmswayApi
  class Message::WapPush < Message
    attr_accessor :url

    def initialize(url = nil)
      super(:wappush)
      @url = url
    end

    def build(xml, start_index = 0)
      super do |xml|
        xml.url @url
      end
    end
  end
end