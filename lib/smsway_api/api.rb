module SmswayApi
  module API
    URL_PREFIX = 'http://my.smsway.ru/'
    DEFAULT_HEADERS = {"Content-Type" => "text/xml; charset=utf-8"}

    class << self
      def call(method, options = {})
        xml = build(method, options)
        request({url: URL, headers: HEADERS, request: xml})
      end

      def request options
        headers = options.delete(:headers) || {}

        uri = URI.parse(URL_PREFIX+options.delete(:path))
        http = Net::HTTP.new(uri.host, uri.port)

        req = Net::HTTP::Post.new(uri.path, DEFAULT_HEADERS.merge(headers))
        req.body = options.delete(:request).target!
        http.request(req).body
      end

      def method_missing name, *args
        klass = "SmswayApi::Method::#{name.to_s.camelize}".constantize
        method = klass.new(*args)
        method.build_xml
        response = request({
          path: method.uri,
          request: method.build_xml
        })
        method.parse(response)
      rescue NameError
        super
      end
    end
  end
end