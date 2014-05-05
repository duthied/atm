# /atm/spec/models/credentials_spec.rb
require 'spec_helper'

describe Credentials do
  let(:credentials) { Credentials.new("123123123", "1234") }

  it "should have a card number" do
    expect(credentials.card_number).to eq("123123123")
  end

  it "should have a pin" do
    expect(credentials.pin).to eq("1234")
  end

end