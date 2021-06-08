class Gamer
  attr_accessor :g_money, :g_hand, :g_score, :name

  def initialize(name)
    @name = name
    @g_money = 100
  end

  def start
  $g_score = 0
  @g_hand = []
    if g_money > 10
      self.g_money -= 10
    else
      puts "You don't have enough money for make bet!"
      exit
    end
  end

  def choose_turn
    puts "Your cards: #{g_hand}. Your score now: #{$g_score}."
    puts 'Press 1 if you want to miss the turn'
    puts 'Press 2 if you want to open cards and see result'
    puts 'Press 3 if you want to add another card to your hand' if g_hand.size < 3
    @answer = gets.chomp.to_i
    action(@answer)
  end

  def action(answer)
    $dealer.turn if answer == 1
    Main.open_cards if answer == 2
    $gamer.another_card if answer == 3
  end

  def refresh
    g_money = 100
    g_hand = []
    $g_score = 0
  end

  def another_card
    $deck.third_card
    g_hand << $third_card
    gamer_score
    puts "Now your cards: #{g_hand} and score #{$g_score}"
    $dealer.turn
  end

  def gamer_score
    $g_score += 10 if g_hand.to_s.include?('J' || 'Q' || 'K')
    $g_score += 1 if ($g_score.to_i + 11) > 21 && g_hand.to_s.include?('A')
    $g_score += 11 if ($g_score.to_i + 11) < 21 && g_hand.to_s.include?('A')
  end

end
