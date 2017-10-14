class Deck
  def initialize
# new deck of 52 cards
    s = ""
    Card.suits.each_key do |suit|
      Card.values.each do |value|
        s += "#{value}#{Card.suits[suit]}\t"
      end
    end
    print s
  end
end
