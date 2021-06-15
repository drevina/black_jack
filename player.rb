class Player
  attr_accessor :name, :money, :hand, :score

  def initialize(name)
    @name = name.to_s
    @money = 100
    @hand = []
    @score = 0
  end

  def make_bet
    if @money > 10
      @money -= 10
    else
      puts "#{name} doesn't have enough money to continue. We need to end the game..."
      exit
    end
  end

  def choose_turn
    puts "Your cards: #{@hand}. Your score now: #{@score}."
    puts 'Press 1 if you want to miss the turn'
    puts 'Press 2 if you want to open cards and see result'
    puts 'Press 3 if you want to add another card to your hand' if @hand.size < 3
    puts 'Press 4 if you want to exit'
    @answer = gets.chomp.to_i
    action(@answer)
    raise choose_turn unless [1, 2, 3, 4].include?(@answer)
  end

  def action(answer)
    Main.get_turn('Dealer') if answer == 1
    Main.open_cards if answer == 2
    Main.third_card(name) if answer == 3
    exit if answer == 4
  end

  def refresh
    @hand = []
    @score = 0
  end
end
