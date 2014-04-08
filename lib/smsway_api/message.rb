module SmswayApi
  class Message
    attr_accessor :sender

    TYPES = [:flashsms, :sms, :vcard, :wappush]

    def initialize(type = :sms)
      self.type = type
      @recepients = []
    end

    def type=(type)
      @type = type if TYPES.include?(type)
    end

    def build(xml)
      xml.message(type: @type) do
        xml.sender @sender
        yield(xml)
        @recepients.each do |r|
          xml.abonent(r)
        end
      end
    end

    # add recepient
    # recepient (Hash) options for recipient
    # allowed options are:
    #   phone: phone number
    #   client_id: sms id in your system
    #   time_send: Time of sms sending
    #   validity_period: Date of
    def add_recipient(recepient = {})
      @recepients.push(recepient)
      # time-send format: YYYY-MM-DD HH:MM
      # validity_period format: YYYY-MM-DD HH:MM
    end
  end
end