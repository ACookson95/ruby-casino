
@blackjack_cards = [
  {card: "\n _____ \n|A    |\n|  *  |\n|    A|\n ''''' \n", value: 1},
  {card: "\n _____ \n|2  * |\n|     |\n| *  2|\n ''''' \n", value: 2},
  {card: "\n _____ \n|3  * |\n|  *  |\n| *  3|\n ''''' \n", value: 3},
  {card: "\n _____ \n|4  * |\n| * * |\n| *  4|\n ''''' \n", value: 4},
  {card: "\n _____ \n|5  * |\n|* * *|\n| *  5|\n ''''' \n", value: 5},
  {card: "\n _____ \n|6 * *|\n| * * |\n|* * 6|\n ''''' \n", value: 6},
  {card: "\n _____ \n|7 * *|\n|* * *|\n|* * 7|\n ''''' \n", value: 7},
  {card: "\n _____ \n|8 ***|\n| * * |\n|*** 8|\n ''''' \n", value: 8},
  {card: "\n _____ \n|9 ***|\n|* * *|\n|*** 9|\n ''''' \n", value: 9},
  {card: "\n _____ \n|10 **|\n|*****|\n|***10|\n ''''' \n", value: 10},
  {card: "\n _____ \n|J   *|\n|JACK |\n|*   J|\n ''''' \n", value: 10},
  {card: "\n _____ \n|Q   *|\n|QUEEN|\n|*   Q|\n ''''' \n", value: 10},
  {card: "\n _____ \n|K   *|\n|KING |\n|*   K|\n ''''' \n", value: 10}
  ]

@face_down_card = {card:"\n _____ \n|/ / /|\n| / / |\n|/ / /|\n ''''' \n", value:0}

def blackjack
  puts "\n=======================================================================".colorize(:cyan)
  puts "\nHi #{@user.name}! Welcome to Blackjack! Are you ready to make some money?!"
  puts "\nSelect an option:"
  puts "1: Start Game"
  puts "2: View Instructions"
  puts "3: Return to the Game Menu"

  case choice = gets.to_i
  when 1
    blackjack_game
  when 2
    blackjack_instructions
  when 3
    game_menu
  else
    puts "Invalid Choice. Try Again"
    blackjack
  end
end

def blackjack_instructions
  puts "The goal of the game is to beat the dealer. Before the cards are dealt,"
  puts "the user will be prompted to place a bet. Then the dealer will deal 2"
  puts "cards to the user face up and 2 to themself, 1 face up and 1 face down."
  puts "The goal of the game is for you hand to equal 21, or closer to 21 than the"
  puts "dealer without going over 21."
  blackjack
end

def blackjack_game
  @user_hand = []
  @dealer_hand = []

  place_bet

  # Starting Hand

  @user_hand << @blackjack_cards.sample
  @user_hand << @blackjack_cards.sample

  @dealer_hand << @blackjack_cards.sample
  
  display_dealer_hand
  display_your_hand


  loop do
    puts "\nHit or Stand"
    puts "1: Hit"
    puts "2: Stand"
    choice = gets.to_i
    if choice == 1
      hit
      if @user_total > 21
        binding.pry
        bust
      end
    elsif choice == 2
      break
    else
      puts "Invalid choice. Try again."
    end
  end

  loop do
    @dealer_total = 0 
    @dealer_hand.each { |c| @dealer_total += c[:value] }
    if @dealer_total >= 17 && @dealer_total <= 21
      display_dealer_hand
      display_your_hand
      break
    elsif @dealer_total > 21
      display_dealer_hand
      display_your_hand
      puts "Dealer bust. You win"
      @user.wallet += (@bet*2)
      play_again
    else
      @dealer_hand << @blackjack_cards.sample
    end
  end



  if @dealer_total == 21 && @user_total != 21
      puts "Dealer got 21. Sorry you lose."
    elsif @dealer_total == 21 && @user_total == 21
      puts "Dealer and Player both got 21. It's a draw."
      @user.wallet += @bet
    elsif @dealer_total > @user_total && @dealer_total < 21
      puts "Sorry you lose. The dealer was closer to 21."
    elsif @dealer_total < @user_total && @user_total < 21
      puts "You were closer to 21. You Win!"
      @user.wallet += (@bet*2)
    elsif @dealer_total == @user_total
      puts "Dealer and Player both got #{@user_total}. It's a draw."
      @user.wallet += @bet
  end


  play_again
end

def display_your_hand
  puts "\nYour hand:"
  @user_hand.each { |c| puts c[:card] }
end

def display_dealer_hand
  puts "\nThe dealers hand:"
  @dealer_hand.each { |c| puts c[:card] }
end

def hit
  @user_hand << @blackjack_cards.sample
  @user_total = 0
  @user_hand.each { |c| @user_total += c[:value] }
  display_dealer_hand
  display_your_hand
end

def bust
  puts "Sorry. That's a bust! You lose this one."
  play_again
end

def twenty_one
  puts "Congrats! You got 21!"
  @user.wallet += (@bet*3)
  play_again
end

def play_again
  puts "\n1: Play Again."
  puts "2: Return to the Menu."
  case choice = gets.to_i
  when 1
    blackjack_game
  else
    blackjack
  end
end
