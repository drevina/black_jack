class Deck
  attr_accessor :value, :suit, :random_card, :cards, :first_card, :second_card, :third_card

  CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUIT = ['♠', '♥', '♣', '♦'].freeze

  def initialize
    @cards = []
  end

  def create_card
    @value = CARD.sample
    @suit = SUIT.sample
    @random_card = "#{@value}#{@suit}"
    cards << random_card
  end

  def give_cards_new
    create_card
    $first_card = random_card
    create_card
    $second_card = random_card
  end

  def third_card
    create_card
    $third_card = random_card
  end
  
end
