# /atm/app/models/api_request_response.rb
class APIRequestResponse

  attr_reader :error
  attr_reader :data

  def initialize(success, data = nil, error = nil)
    @success = success
    @error = error
    @data = JSON.parse data if data
  end

  def success?
    @success
  end

end
