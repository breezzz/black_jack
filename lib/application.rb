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
    @items = {
        '1': { item: 'Пропустить ход', method: 'next_move' },
        '2': { item: 'Взять карту', method: 'take_card' },
        '3': { item: 'Открыть карты', method: 'open_cards' }
    }

    @items.each_key do |key|
      print "#{key}. #{@items[key].dig(:item)}\t"
    end
    puts "\nДействие: "
    user_enter = gets.chomp.to_sym
    if @items.keys.include? user_enter
      print "OK #{@items[user_enter].dig(:method)}\n"
    else
      print "BAD"
    end
  end
end
