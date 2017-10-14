#! /usr/bin/env ruby
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

system('clear')
puts 'Добро пожаловать в игру Black Jack'
puts 'Введите ваше имя:'
master = Hand.new(gets.chomp)
dealer = Hand.new('JoJo', false)
deck = Deck.new
deck.shuffle
app = Application.new
loop do
  # выдаем две случайные карты каждому и делаем ставки#
  2.times{master.get_card(deck.take_card)}
  master.bet
  2.times{dealer.get_card(deck.take_card)}
  dealer.bet
  #---------------------------------------------------#
  #выводим результат#
  system('clear')
  app.screen(master, true)
  app.screen(dealer, true)
  #---------------------------------------------------#
  #выводим меню#
  #Пропустить ход
  #Взять карту если карт меньше 3
  #Открыть карты

  #Если карт стает 3 у кого-либо - карты открыть автоматически

  #Ходы дилера:
  #Пропустить ход
  #Взять карту если карт меньше 3


  #После открытия карт:
  #У кого меньше 21 и ближе к 21 тот выиграл
  #У кого больше 21 - проиграл
  #Сумма банка переходит в выигравшему

  #Спросить играть снова или выход
  #Если играть снова банк не обнулять, выдать новую колоду
  #---------------------------------------------------#
  break if gets.chomp == 'exit'
end
