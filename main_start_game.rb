require_relative 'gamer'
require_relative 'dealer'
require_relative 'deck'

class Main

  attr_accessor :player, :enemy, :new_deck, :third_card

  def self.new_game
    puts "Hello, what's your name?"
    name = gets.chomp
    @player = Gamer.new(name)
    @enemy = Dealer.new
    @new_deck = Deck.new
    start_game
  end

  def self.start_game
    @player.gamer_start
    @enemy.dealer_start
    @new_deck.give_cards_new
    @player.g_hand << @new_deck.first_card
    @player.g_hand << @new_deck.second_card
    @new_deck.give_cards_new
    @enemy.d_hand << @new_deck.first_card
    @enemy.d_hand << @new_deck.second_card
    @player.gamer_score
    @enemy.dealer_score
    @player.choose_turn
  end

  def self.open_cards
    puts "You have #{@player.g_hand} with total score #{@player.g_score}"
    puts "Dealer has #{@enemy.d_hand} with total score #{@enemy.d_score}"
      if @enemy.d_score == @player.g_score
        puts 'Draw!'
        @enemy.d_money += 10
        @player.g_money += 10
      elsif (@player.g_score > 21) || (@enemy.d_score > @player.g_score && @enemy.d_score <= 21)
        puts 'You lose!'
        @enemy.d_money += 20
      else
        puts 'You won!'
        @player.g_money += 20
      end
    puts "Press 1 if you want to play next part"
    puts "Press 2 if you want to exit"
    choice = gets.chomp.to_i
      if choice == 1
        Main.start_game
      else
        exit
      end
  end

  def self.dealer_turn
    @enemy.turn
  end

  def self.gamer_turn
    @player.choose_turn
  end

  def self.third_card_gamer
    @new_deck.make_third_card
    @player.g_hand << @new_deck.third_card
  end

  def self.third_card_dealer
    @new_deck.make_third_card
    @enemy.d_hand << @new_deck.third_card
  end

end

Main.new_game
