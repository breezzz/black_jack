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
end
