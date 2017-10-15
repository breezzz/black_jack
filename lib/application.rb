class Application
  def screen(hand, open = false)
    puts "#{hand.name} cards:"
    if open
      hand.cards.map { |card| print "#{card.name}\t" }
      puts "\nОчков #{hand.check_points}"
    else
      hand.cards.map { print "*\t" }
      puts ''
    end
    puts "Кошелек #{hand.money}\n#-------------------#"
  end

  def menu
    @items = ['Пропустить ход', 'Взять карту', 'Открыть карты'].freeze
    @items.each.with_index(1) { |item, index| print "#{index}. #{item}\t" }
    puts "\nДействие: "
    gets.chomp.to_i
  end

  def take_card(hand, deck)
    hand.take_card(deck.take_card) if hand.cards.size < 3
  end

  def run(master, dealer, deck)
    2.times { take_card(master, deck) }
    master.bet(30)
    2.times { take_card(dealer, deck) }
    dealer.bet(30)
    # выводим результат #
    system('clear')
    puts "Банк: #{Hand.bank}"
    screen(master, true)
    screen(dealer)
    loop do
      ### user move
      m = menu
      puts m
      break if m == 3
      take_card(master, deck) if m == 2
      # выводим результат #
      system('clear')
      puts "Банк: #{Hand.bank}"
      screen(master, true)
      screen(dealer)

      ### dealer move
      take_card(dealer, deck) if dealer.check_points <= 11
      # выводим результат #
      system('clear')
      puts "Банк: #{Hand.bank}"
      screen(master, true)
      screen(dealer)
      break if master.cards.size == 3 || dealer.cards.size == 3
    end

    system('clear')
    puts 'Game Over:'
    screen(master, true)
    screen(dealer, true)

    # check and return winner
    return dealer if dealer.check_points == 21
    return master if master.check_points == 21
    return dealer if master.check_points > 21
    return master if dealer.check_points > 21

    if dealer.check_points >= master.check_points
      dealer
    else
      master
    end
  end
rescue RuntimeError => e
  puts e
end
