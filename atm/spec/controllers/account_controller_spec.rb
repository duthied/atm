require 'spec_helper'

describe AccountController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    pending
    # it "returns http success" do
    #   get 'show'
    #   response.should be_success
    # end
  end

end
