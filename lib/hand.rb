class Hand
  attr_reader :name, :ai, :cards, :money

  def initialize(name, ai = false)
    @name = name
    @ai = ai
    @cards = []
    @points = 0
    @money = 100
  end

  def get_card(card)
    @cards << card
  end

  def bet(money = 10)
    @money -= money if @money > 0
  end

  def get_money(money)
    @money += money
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
end
