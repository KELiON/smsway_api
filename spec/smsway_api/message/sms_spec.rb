require 'spec_helper'

describe SmswayApi::Message::Sms do
  let(:sms) { SmswayApi::Message::Sms.new }

  describe ".initialize" do
    it "should have sms type" do
      expect(sms.type).to eq(:sms)
    end

    it "should have message" do
      expect(SmswayApi::Message::Sms.new('test').message).to eq('test')
    end
  end
end