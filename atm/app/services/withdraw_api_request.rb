# /atm/app/services/withdraw_api_request.rb
class WithdrawAPIRequest < APIRequest

  def self.call(credentials, amount, end_point)
    params = {'amount' => amount}
    request_post(end_point, params, credentials.card_number, credentials.pin)
  end

end
