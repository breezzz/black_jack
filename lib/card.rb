class Card
  SUITS = { heart: '♡', diamond: '♢', spade: '♤', club: '♧' }.freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :suit, :rank, :name

  class << self
    def suits
      SUITS
    end

    def ranks
      RANKS
    end

    def graf_suit(suit)
      suits[suit]
    end
  end

  def initialize(options)
    @suit = options[:suit]
    @rank = options[:rank]
    validate!
    @name = @rank + self.class.graf_suit(@suit)
  end

  def cost
    return 'ace' if @rank == 'A'
    return 10 if @rank.to_i.zero?
    @rank.to_i
  end

  private

  def validate!
    raise 'Неправильная масть' unless self.class.suits.key? @suit
    raise 'Неправильнoe значение' unless self.class.ranks.include? @rank
  end
end
