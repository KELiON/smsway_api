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
        req.body = options.delete(:request)
        response = http.request(req).body
        if SmswayApi.log_requests
          SmswayApi.logger.debug("[smswayapi] request \n #{req.body}")
        end
        if SmswayApi.log_responses
          SmswayApi.logger.debug("[smswayapi] response \n #{response}")
        end
        response
      end

      def method_missing name, *args
        api_method = "SmswayApi::Method::#{name.to_s.camelize}".constantize.new(*args)
        api_method.build_xml
        response = request({
          path: api_method.uri,
          request: api_method.build_xml
        })
        api_method.parse(response)
      rescue NameError
        super
      end
    end
  end
end