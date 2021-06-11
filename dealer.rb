require_relative 'gamer'
require_relative 'deck'

class Dealer
  attr_accessor :d_money, :d_hand, :d_score

  def initialize
    @d_money = 100
  end

  def dealer_start
  @d_score = 0
  @d_hand = []
    if d_money > 10
      self.d_money -= 10
    else
      puts "You beat the dealer! He doesn't have any money for bet!"
      exit
    end
  end

  def turn
    Main.player_turn if d_score > 17
    another_card if d_score < 17 && d_hand.size < 3
    Main.open_cards if d_hand.size == 3 && g_hand.size == 3
  end

  def another_card
    Main.third_card_dealer
    Main.gamer_turn
  end

  def refresh
    d_money = 100
    d_hand = []
    d_score = 0
  end

  def dealer_score
    self.d_score += 10 if d_hand.to_s =~ /J|Q|K/
    self.d_score += 1 if (d_score.to_i + 11) > 21 && d_hand.to_s.include?('A')
    self.d_score += 11 if (d_score.to_i + 11) < 21 && d_hand.to_s.include?('A')
  end


end
