# /atm/app/models/user.rb
class User

  attr_writter :card_number, :pin

  def initialize(card_number, pin)
    @card_number = card_number
    @pin = pin
    self
  end

end