class Dealer < Player
  def initialize(name)
    super
  end

  def dealer_turn
    if score >= 17
      puts 'Dealer is ready for opening cards'
      Main.get_turn(nil)
    else score < 17 && hand.size < 3
         Main.third_card('Dealer')
    end
  end
end
