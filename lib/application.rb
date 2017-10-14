class Application
  def screen(user, dealer, open = false)
    system('clear')
    puts '#-------------------#'
    puts "#{user.name} cards:"
    user.cards.map {|card| print "#{card.name}\t"}
    puts ''
    puts "Очков   #{user.check_points}"
    puts "Кошелек   #{user.money}"
    puts '#-------------------#'
    puts "#{dealer.name} cards:"
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
end