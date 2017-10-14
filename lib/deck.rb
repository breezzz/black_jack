class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card.suits.each_key do |suit|
      Card.ranks.each do |rank|
        @cards << Card.new(suit: suit, rank: rank)
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
