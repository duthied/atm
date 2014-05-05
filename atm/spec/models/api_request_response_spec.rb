# /atm/spec/models/credentials_spec.rb
require 'spec_helper'

describe APIRequestResponse do
  
  describe "failed response" do
    before do
      @api_request_response = APIRequestResponse.new(false, nil, "some error")
    end

    it "should report correct success" do
      expect(@api_request_response.success?).to eq(false)
    end

    it "should have an error" do
      expect(@api_request_response.error).to eq("some error")
    end

    it "should not have data" do
      expect(@api_request_response.data).to eq(nil)
    end
  end

  
  describe "successful response" do
    before do
      @api_request_response = APIRequestResponse.new(true, "{\"balance\":\"0.0\"}", nil)
    end

    it "should report correct success" do
      expect(@api_request_response.success?).to eq(true)
    end

    it "should not have an error" do
      expect(@api_request_response.error).to eq(nil)
    end

    it "should have data" do
      expect(@api_request_response.data).to eq({"balance"=>"0.0"})
    end
  end

end