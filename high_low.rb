@high_low_cards = [
  {card: "\n _____ \n|A    |\n|  *  |\n|    A|\n ''''' \n", value: 1, low: nil, high: nil},
  {card: "\n _____ \n|2  * |\n|     |\n| *  2|\n ''''' \n", value: 2, low: 10.7, high: 1.1},
  {card: "\n _____ \n|3  * |\n|  *  |\n| *  3|\n ''''' \n", value: 3, low: 5.3, high: 1.1},
  {card: "\n _____ \n|4  * |\n| * * |\n| *  4|\n ''''' \n", value: 4, low: 3.5, high: 1.1},
  {card: "\n _____ \n|5  * |\n|* * *|\n| *  5|\n ''''' \n", value: 5, low: 2.6, high: 1.3},
  {card: "\n _____ \n|6 * *|\n| * * |\n|* * 6|\n ''''' \n", value: 6, low: 2.1, high: 1.5},
  {card: "\n _____ \n|7 * *|\n|* * *|\n|* * 7|\n ''''' \n", value: 7, low: 1.7, high: 1.7},
  {card: "\n _____ \n|8 ***|\n| * * |\n|*** 8|\n ''''' \n", value: 8, low: 1.5, high: 2.1},
  {card: "\n _____ \n|9 ***|\n|* * *|\n|*** 9|\n ''''' \n", value: 9, low: 1.3, high: 2.6},
  {card: "\n _____ \n|10 **|\n|*****|\n|***10|\n ''''' \n", value: 10, low: 1.1, high: 3.5},
  {card: "\n _____ \n|J   *|\n|JACK |\n|*   J|\n ''''' \n", value: 11, low: 1.1, high: 5.3},
  {card: "\n _____ \n|Q   *|\n|QUEEN|\n|*   Q|\n ''''' \n", value: 12, low: 1.1, high: 10.7},
  {card: "\n _____ \n|K   *|\n|KING |\n|*   K|\n ''''' \n", value: 13, low: nil, high: nil}
]

def high_low
  puts "\n=======================================================================".colorize(:cyan)
  puts "\nHi #{@user.name}! Welcome to High / Low!! Are you ready to make some money?!"
  puts "\nSelect an option:"
  puts "1: Start Game"
  puts "2: View Instructions"
  puts "3: Return to the Game Menu"

  case choice = gets.to_i
  when 1
    start_game
  when 2
    high_low_instructions
  when 3
    game_menu
  else
    puts "Invalid Choice. Try Again"
    high_low
  end
end

def high_low_instructions
  puts "\nThe game is simple. There is an initial card shown. The goal is to guess whether the"
  puts "following card flipped will be higher or lower than the card shown. The winnings will"
  puts "change based off of the odds of winning. Kings and Aces do not count as initial cards"
  puts "and a new card will be drawn in its stead. Good Luck!"
  high_low
end

def start_game
  
  if @user.wallet <= 0
    puts "\nYou don't have enough money to play."
    puts "Returning to the menu."
    high_low
  end

  high_low_card = @high_low_cards[1..11].sample 

  puts "\nThe first card is:"
  puts high_low_card[:card].colorize(:red)

  place_bet

  puts "\nMake Your Guess"
  puts "1: High - Payout $#{(@bet*high_low_card[:high]).to_i}"
  puts "2: Low - Payout $#{(@bet*high_low_card[:low]).to_i}"
  puts "Any other key to cancel and quit the game"

  choice = gets.to_i

  if choice == 1
    choice = 'high'
  elsif choice == 2
    choice = 'low'
  else
    puts "Invalid choice."
    start_game
  end

  high_low_card_2 = @high_low_cards.sample

  puts "The second card is:"
  puts high_low_card_2[:card].colorize(:red)

        #high win
      if high_low_card_2[:value] > high_low_card[:value] && choice == 'high'
        puts "Congrats! You guessed right!"
        @winnings = (@bet*high_low_card[:high]).to_i
        puts "You won $#{@winnings}!"
        @user.wallet += @winnings
        
        #high lose
      elsif high_low_card_2[:value] < high_low_card[:value] && choice == 'high'
        puts "Sorry. You guessed wrong this time."

        #low win
      elsif high_low_card_2[:value] < high_low_card[:value] && choice == 'low'
        puts "Congrats! You guessed right!"
        @winnings = (@bet*high_low_card[:low]).to_i
        puts "You won $#{@winnings}!"
        @user.wallet += @winnings
        
        #low lose
      elsif high_low_card_2[:value] > high_low_card[:value] && choice == 'low'
        puts "Sorry. You guessed wrong this time."
        
        #draw
      elsif high_low_card_2[:value] == high_low_card[:value]
        puts "It's a draw! You can have your bet back."
        @user.wallet += @bet
      
      end

  puts "\n1: Play Again."
  puts "2: Return to the Menu."
  case choice = gets.to_i
  when 1
    start_game
  else
    high_low
  end
end
