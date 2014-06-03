# Account controller
class AccountController < ApplicationController

  def index
    @accounts = find_accounts
  end

  def show
    @account = find_account(params[:id])
    @withdraw_uri = @account['links']
      .find { |h| h['type'] == 'withdraw' }['uri']
  end

  def withdraw
    credentials = find_credentials
    response = WithdrawAPIRequest
      .call(credentials, params[:amount], params[:endpoint])

    @result = response.data['response']['result'] ? 'Success' : 'Failure'
    @balance = response.data['response']['balance']
  end

  private

  def find_accounts
    credentials = find_credentials
    AccountsAPIRequest.call(credentials).data
  end

  def find_account(id)
    credentials = find_credentials
    response = AccountsAPIRequest.call(credentials)
    response.data.find { |h| h['id'] == id.to_i }
  end

end
