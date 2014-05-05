# /atm/app/models/credentials.rb
class Credentials

  attr_reader :card_number, :pin

  def initialize(card_number, pin)
    @card_number = card_number
    @pin = pin
  end

end