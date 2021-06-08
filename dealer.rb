class Dealer
  attr_accessor :d_money, :d_hand, :d_score

  def initialize
    @d_money = 100
  end

  def start
  $d_score = 0
  @d_hand = []
    if d_money > 10
      self.d_money -= 10
    else
      puts "You beat the dealer! He doesn't have any money for bet!"
      exit
    end
  end

  def turn
    $gamer.choose_turn if $d_score > 17
    $dealer.another_card if $d_score < 17 && d_hand.size < 3
    Main.open_cards if d_hand.size == 3 && $gamer.g_hand.size == 3
  end

  def another_card
    $deck.third_card
    d_hand << $third_card
    $gamer.choose_turn
  end

  def refresh
    d_money = 100
    d_hand = []
    $d_score = 0
  end

  def dealer_score
    $d_score += 10 if d_hand.to_s.include?('J' || 'Q' || 'K')
    $d_score += 1 if ($d_score.to_i + 11) > 21 && d_hand.to_s.include?('A')
    $d_score += 11 if ($d_score.to_i + 11) < 21 && d_hand.to_s.include?('A')
  end


end
