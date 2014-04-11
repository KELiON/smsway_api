module SmswayApi
  class Message
    attr_accessor :sender

    attr_reader :recepients
    attr_reader :type

    TYPES = [:flashsms, :sms, :vcard, :wappush]

    def initialize(type = :sms)
      self.type = type
      @sender = SmswayApi.default_sender
      @recepients = []
    end

    def type=(type)
      @type = type if TYPES.include?(type)
    end

    def build(xml, start_index = 0)
      xml.message(type: @type) do
        xml.sender @sender
        yield(xml)
        @recepients.each.with_index do |r, index|
          xml.abonent(r.merge(number_sms: start_index + index))
        end
      end
    end

    # add recepient
    # recepient (Hash or String) options for recipient
    # allowed options are:
    #   phone: phone number
    #   client_id: sms id in your system
    #   time_send: Time of sms sending
    #   validity_period: Date of
    # if String is given than it means only phone
    def add_recipient(recepient = {})
      if recepient.is_a?(String)
        # convert string value to correct hash
        recepient = {phone: recepient}
      end
      recepient[:phone] = format_phone(recepient[:phone])
      @recepients.push(recepient)
      # time-send format: YYYY-MM-DD HH:MM
      # validity_period format: YYYY-MM-DD HH:MM
    end

    private
    def format_phone phone
      phone.gsub(/\A(\+7|8)/, '7').gsub(/[^\d]/, '')
    end
  end
end