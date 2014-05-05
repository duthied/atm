# /atm/app/services/api_request.rb
require 'open-uri'
require 'net/http'

class APIRequest

  def self.request_get(uri, card_number, pin)
    endpoint = URI.parse(uri)
    # http = Net::HTTP.new(endpoint.host, endpoint.port)
    request = create_request_get(endpoint, card_number, pin)
    make_request(Net::HTTP.new(endpoint.host, endpoint.port), request)
  end

  def self.request_post(uri, params, card_number, pin)
    endpoint = URI.parse(uri)
    # http = Net::HTTP.new(endpoint.host, endpoint.port)
    request = create_request_post(endpoint, card_number, pin)
    request.set_form_data(params)
    make_request(Net::HTTP.new(endpoint.host, endpoint.port), request)
  end

  private

    def self.create_request_post(endpoint, card_number, pin)
      request = Net::HTTP::Post.new(endpoint.request_uri)
      request["X-Card-Number"] = card_number
      request["X-Pin"] = pin
      return request
    end

    def self.create_request_get(endpoint, card_number, pin)
      request = Net::HTTP::Get.new(endpoint.request_uri)
      request["X-Card-Number"] = card_number
      request["X-Pin"] = pin
      return request
    end

    def self.make_request(http, request)
      begin
        response = http.request(request)
        if response.code == "200"
          APIRequestResponse.new(true, response.body, nil)
        else
          APIRequestResponse.new(false, nil, "Error: code #{response.code}")
        end
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, Errno::ECONNREFUSED, EOFError,
         Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => error
        APIRequestResponse.new(false, nil, error.message)
      end
    end

end
