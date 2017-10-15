class Application
  def menu
    @items = ['Пропустить ход', 'Взять карту', 'Открыть карты'].freeze
    @items.each.with_index(1) { |item, index| print "#{index}. #{item}\t" }
    puts "\nДействие: "
    gets.chomp.to_i
  end

  def take_card(hand, deck)
    hand.take_card(deck.take_card) if hand.cards.size < 3
  end

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

  def game_screen(master, dealer)
    system('clear')
    puts "Банк: #{Hand.bank}"
    screen(master, true)
    screen(dealer)
  end

  def end_game_screen(master, dealer)
    system('clear')
    puts 'Game Over:'
    screen(master, true)
    screen(dealer, true)
  end

  def check_winner(master, dealer)
    return dealer if dealer.check_points == 21
    return master if master.check_points == 21
    return dealer if master.check_points > 21
    return master if dealer.check_points > 21
    dealer.check_points >= master.check_points ? dealer : master
  end

  def game_prepare(master, dealer, deck)
    2.times { take_card(master, deck) }
    master.bet
    2.times { take_card(dealer, deck) }
    dealer.bet
    game_screen(master, dealer)
  end

  def run(master, dealer, deck)
    game_prepare(master, dealer, deck)
    loop do
      ### user move
      m = menu
      break if m == 3
      take_card(master, deck) if m == 2
      game_screen(master, dealer)
      ### dealer move
      take_card(dealer, deck) if dealer.check_points <= 11
      game_screen(master, dealer)
      break if master.cards.size == 3 || dealer.cards.size == 3
    end
    end_game_screen(master, dealer)
    check_winner(master, dealer)
  rescue RuntimeError => e
    puts e
  end
end
