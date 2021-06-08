require_relative 'gamer'
require_relative 'dealer'
require_relative 'deck'

class Main

  def self.new_game
    puts "Hello, what's your name?"
    name = gets.chomp
    $gamer = Gamer.new(name)
    $dealer = Dealer.new
    $deck = Deck.new
    start_game
  end

  def self.start_game
    $gamer.start
    $dealer.start
    $deck.give_cards_new
    $gamer.g_hand << $first_card
    $gamer.g_hand << $second_card
    $deck.give_cards_new
    $dealer.d_hand << $first_card
    $dealer.d_hand << $second_card
    $gamer.gamer_score
    $dealer.dealer_score
    $gamer.choose_turn
  end

  def self.open_cards
    puts "You have #{$gamer.g_hand} with total score #{$g_score}"
    puts "Dealer has #{$dealer.d_hand} with total score #{$d_score}"
      if $d_score == $g_score
      puts 'Draw!'
      $dealer.d_money += 10
      $gamer.g_money += 10
      elsif ($g_score > 21) || ($d_score > $g_score && $d_score <= 21)
      puts 'You lose!'
      $dealer.d_money += 20
      else
      puts 'You won!'
      $gamer.g_money += 20
      end
    puts "Press 1 if you want to play next part"
    puts "Press 2 if you want to exit"
    @choice = gets.chomp.to_i
      if @choice == 1
        self.start_game
      else
        exit
      end
  end

end

Main.new_game
