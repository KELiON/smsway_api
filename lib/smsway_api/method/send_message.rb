module SmswayApi
  class Method::SendMessage < SmswayApi::Method
    def initialize *args
      if args.first.is_a?(SmswayApi::Message)
        @messages = args
      elsif args.length == 2 && args.first.is_a?(String)
        @messages = []
        sms = SmswayApi::Message::Sms.new(args.first)
        sms.add_recipient(args.last)
        @messages << sms
      else
        @messages = Array.wrap(args.first)
      end
    end

    def build_xml
      super do |xml|
        abonents = 1
        @messages.each do |m|
          m.build(xml, abonents)
          abonents += m.recepients.size
        end
      end
    end

    def uri
      'xml/index.php'
    end

    def parse response
      Hash.from_xml(response)
    end
  end
end