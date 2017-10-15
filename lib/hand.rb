class Hand
  attr_reader :name, :ai, :cards, :money
  @bank = 0

  class << self
    attr_reader :bank

    def add_to_bank(money)
      @bank += money
    end

    def take_from_bank
      money = @bank
      @bank = 0
      money
    end
  end

  def initialize(name, ai = false)
    @name = name
    @ai = ai
    @cards = []
    @points = 0
    @money = 100
    @bet = 0
    validate!
  end

  def take_card(card)
    @cards << card
  end

  def clear_cards
    @cards = []
  end

  def bet(bet = 10)
    @bet = bet
    validate!
    @money -= @bet if @money > 0
    self.class.add_to_bank(@bet)
  end

  def take_bank
    @money += self.class.take_from_bank
  end

  def check_points
    return if @cards.empty?
    @points = 0
    aces =  @cards.count { |card| card.rank == 'A' }
    @points += 11 + 1 * (aces - 1) if aces > 0
    @cards.each do |card|
      @points += card.cost if card.cost.is_a? Integer
    end
    @points
  end

  private

  def validate!
    raise 'Пустое имя' if @name.empty?
    raise 'Денег не хватает!' if @bet > @money
  end
end
