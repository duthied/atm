# /atm/app/services/accounts_api_request.rb
class AccountsAPIRequest < APIRequest

  # TODO find cleaner way to store the urls
  @@end_point = 'http://localhost:3000/api/accounts'

  def self.call(credentials)
    request_get(@@end_point, credentials.card_number, credentials.pin)
  end

end
