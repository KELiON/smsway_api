module SmswayApi
  module API
    URL_PREFIX = 'http://my.smsway.ru'
    HEADERS = {"Content-Type" => "text/xml; charset=utf-8"}

    class << self
      def call(method, options = {})
        xml = build(method, options)
        request({url: URL, headers: HEADERS, request: xml})
      end

      def send_messages messages = []
        messages = Array.wrap(messages)
        xml = Builder::XmlMarkup.new
        xml.instruct!
        xml.request do
          abonents = 1
          messages.each do |m|
            m.build(xml, abonents)
            abonents += m.recepients.size
          end
          xml.security do
            xml.login(value: SmswayApi.login)
            xml.password(value:  SmswayApi.password)
          end
        end
        xml
      end

      def request(options = {})
        path = options.delete(:path)
        headers = options.delete(:headers)

        uri = URI.parse(URL_PREFIX)
        http = Net::HTTP.new(uri.host, uri.port)
        req = Net::HTTP::Post.new(path, headers)
        req.body = options.delete(:request)
        response = http.request(req)
        response.body
      end
    end
  end
end