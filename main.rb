require_relative './lib/hand'

def screen(user, dealer, open = false)
  system('clear')
  puts open.class
  puts '#-------------------#'
  puts 'YOUR CARDS:'
  user.cards.map {|card| print "#{card.name}\t"}
  puts ''
  puts "Очков   #{user.check_points}"
  puts "Кошелек   #{user.money}"
  puts '#-------------------#'
  puts 'Dealer CARDS:'
  case open
    when true
      dealer.cards.map {|card| print "#{card.name}\t"}
      puts ''
      puts "Очков   #{dealer.check_points}"
    else
      dealer.cards.map {|card| print "*\t"}
      puts ''
  end
  puts "Кошелек   #{dealer.money}"
  puts '#-------------------#'
end

master = Hand.new('Ruslan')
dealer = Hand.new('JoJo', false)
deck = Deck.new
deck.shuffle
loop do
  master.get_card(deck.take_card)
  dealer.get_card(deck.take_card)
  screen(master, dealer, true)
#  puts master.cards.inspect
#  puts "очков   #{master.check_points}"
  break if gets.chomp == 'qwe'
#  puts '#---------------------------------#'
end

