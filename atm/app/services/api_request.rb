# /atm/app/services/api_request.rb
require 'open-uri'

class APIRequest

  def self.make_request(uri, card_number, pin)
    
    Rails.logger.debug("calling #{uri}")

    begin
      result = open(uri, 'X-Card-Number' => card_number, 'X-Pin' => pin).read

      Rails.logger.debug("result: #{result}")

      APIRequestResponse.new(true, result)

    rescue OpenURI::HTTPError => error
      APIRequestResponse.new(false, error.message)
    end
  end

end
