module SmswayApi
  class Client
    URL = 'http://my.smsway.ru/xml/'

    def send(request)
      uri = URI.parse(URL)
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(uri.path, headers)
      req.body = request
      response = http.request(req)
      response.body
    end

    def send_message(message, number, sender)
    end
  end
end