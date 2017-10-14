class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card.suits.each_key do |suit|
      Card.values.each do |value|
        @cards << Card.new(suit: suit, value: value)
      end
    end
  end

  def shuffle
    cards.shuffle!.reverse!.shuffle!
  end

  def take_card
    cards.pop
  end
end
