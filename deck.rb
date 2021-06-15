class Deck
  attr_accessor :cards, :value, :suit, :random_card, :hand

  CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUIT = ['♠', '♥', '♣', '♦'].freeze

  def initialize
    @cards = []
  end

  def create_card
    @value = Random.rand(CARD.length)
    @suit = SUIT.sample
    @random_card = "#{CARD[value]} #{suit}"
    cards << random_card
  end

  def make_third_card
    create_card
    @third_card = random_card
  end

  def count(hand)
    @hand = hand
    result = 0
    hand.each do |value, _suit|
      result += 10 if value =~ /J|Q|K/
      result += 1 if (result + 11) > 21 && value =~ /A/
      result += 11 if (result + 11) < 21 && value =~ /A/
      result += value.to_i unless %w[J".to_sym Q".to_sym K".to_sym A".to_sym].include?(value.to_sym)
    end
    result
  end
end
