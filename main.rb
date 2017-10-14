Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

system('clear')
puts 'Добро пожаловать в игру Black Jack'
puts 'Введите ваше имя:'
master = Hand.new(gets.chomp)
dealer = Hand.new('JoJo', false)
deck = Deck.new
deck.shuffle
app = Application.new
loop do
  master.get_card(deck.take_card)
  master.bet
  dealer.get_card(deck.take_card)
  dealer.bet
  app.screen(master, dealer, true)
  break if gets.chomp == 'qwe'
end

