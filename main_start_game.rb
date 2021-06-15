require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

class Main
  def self.new_game
    puts "Hello, what's your name?"
    name = gets.chomp
    @gamer = Player.new(name)
    @dealer = Dealer.new('Dealer')
    @deck = Deck.new
    start_game
  end

  def self.start_game
    @gamer.refresh
    @dealer.refresh
    @gamer.make_bet
    @dealer.make_bet
    2.times do
      @deck.create_card
      @dealer.hand << @deck.random_card
      @deck.create_card
      @gamer.hand << @deck.random_card
    end
    @dealer.score = @deck.count(@dealer.hand)
    @gamer.score = @deck.count(@gamer.hand)
    @gamer.choose_turn
  end

  def self.open_cards
    puts "You have #{@gamer.hand} with total score #{@gamer.score}"
    puts "Dealer has #{@dealer.hand} with total score #{@dealer.score}"
    if @dealer.score == @gamer.score
      puts 'Draw!'
      @dealer.money += 10
      @gamer.money += 10
    elsif (@gamer.score > 21) || (@dealer.score > @gamer.score && @dealer.score <= 21)
      puts 'You lose!'
      @dealer.money += 20
    else
      puts 'You won!'
      @gamer.money += 20
    end
    puts 'Press 1 if you want to play next part'
    puts 'Press 2 if you want to exit'
    choice = gets.chomp.to_i
    if choice == 1
      Main.start_game
    else
      exit
    end
  end

  def self.third_card(name)
    if name == @gamer.name
      @deck.create_card
      @gamer.hand << @deck.random_card
      @gamer.score = @deck.count(@gamer.hand)
      @dealer.dealer_turn
    else
      @deck.create_card
      @dealer.hand << @deck.random_card
      @dealer.score = @deck.count(@dealer.hand)
      @gamer.choose_turn
    end
  end

  def self.get_turn(name)
    if name.nil?
      @gamer.choose_turn
    else
      @dealer.dealer_turn
    end
  end
end

Main.new_game
