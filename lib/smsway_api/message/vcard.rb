module SmswayApi
  class Message::Vcard < Message
  # allowed options:
  #   url
  #   name
  #   phone
  #     cell
  #     work
  #     fax
  #   email
  #   position
  #   organization
  #   address
  #      post_office_box
  #      street
  #      city
  #      region
  #      postal_code
  #      country
  #   additional
  def initialize(vcard = {})
    super(:vcard)
    @vcard = vcard
  end

  def build(xml, start_index = 0)
    super do |xml|
      [:url, :name, :email, :position, :organization, :additional, :phone, :address].each do |key|
        if @vcard.has_key?(key)
          xml.tag!(key, @vcard[key])
        end
      end
    end
  end
  end
end