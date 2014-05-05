# /atm/app/services/accounts_api_request.rb
class AccountsAPIRequest < APIRequest

  # TODO find cleaner way to store the urls
  @@end_point = "#{Rails.application.config.bank_url}/api/accounts"

  def self.call(credentials)
    request_get(@@end_point, credentials.card_number, credentials.pin)
  end

end
