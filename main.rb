#! /usr/bin/env ruby
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

system('clear')
puts 'Добро пожаловать в игру Black Jack'
begin
  puts 'Введите ваше имя:'
  name = gets.chomp
  master = Hand.new(name)
rescue RuntimeError => e
  puts e
  retry
end
dealer = Hand.new('JoJo', true)
loop do
  master.clear_cards
  dealer.clear_cards
  deck = Deck.new
  deck.shuffle
  winner = Application.new.run(master, dealer, deck)
  puts "Выигрыш: #{Hand.bank}"
  puts "Победитель: #{winner.name}"
  winner.take_bank
  puts "Кошелек: #{winner.money}"
  puts '1 для выхода, любая клавиша для продолжения'
  break if gets.chomp == '1'
end
