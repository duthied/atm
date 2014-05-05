# /atm/app/services/auth_api_request.rb
class AuthAPIRequest < APIRequest

  # TODO find cleaner way to store the urls
  @@auth_end_point = 'http://localhost:3000/api/user'

  def self.call(card_number, pin)
    response = request_get(@@auth_end_point, card_number, pin)
  end

end
