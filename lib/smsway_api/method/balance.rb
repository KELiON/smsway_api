module SmswayApi
  class Method::Balance < SmswayApi::Method
    def uri
      'xml/balance.php'
    end

    def parse response
      Hash.from_xml(response)
    end
  end
end