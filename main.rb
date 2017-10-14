require_relative './lib/hand'

master = Hand.new('Ruslan')
dealer = Hand.new('JoJo', false)
deck = Deck.new
deck.shuffle
loop do
  master.get_card(deck.take_card)
  puts master.cards.inspect
  puts "очков   #{master.check_points}"
  break if gets.chomp == 'qwe'
  puts '#---------------------------------#'
end

