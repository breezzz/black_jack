class Card
  SUITS = { heart: '♡', diamond: '♢', spade: '♤', club: '♧' }.freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :suit, :value, :name

  class << self
    def suits
      SUITS
    end

    def values
      VALUES
    end

    def graf_suit(suit)
      suits[suit]
    end
  end

  def initialize(options)
    @suit = options[:suit]
    @value = options[:value]
    validate!
    @name = @value + self.class.graf_suit(@suit)
  end

  def cost
    return 'ace' if @value == 'A'
    return 10 if @value.to_i.zero?
    @value.to_i
  end

  private

  def validate!
    raise 'Неправильная масть' unless self.class.suits.key? @suit
    raise 'Неправильнoe значение' unless self.class.values.include? @value
  end
end
