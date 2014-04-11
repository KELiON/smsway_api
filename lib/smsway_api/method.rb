module SmswayApi
  class Method

    def build_xml
      xml = Builder::XmlMarkup.new
      xml.instruct!
      xml.request do
        yield(xml) if block_given?
        xml.security do
          xml.login(value: SmswayApi.login)
          xml.password(value:  SmswayApi.password)
        end
      end
      xml.target!
    end

    def parse_response response
      raise 'not implemented'
    end

    def uri
      ''
    end

    def http_verb
      :post
    end

  end
end