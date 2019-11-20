@high_low_cards = [
  {card: 'Ace', value: 1, low: nil, high: nil},
  {card: '2', value: 2, low: 10.7, high: 1.1},
  {card: '3', value: 3, low: 5.3, high: 1.1},
  {card: '4', value: 4, low: 3.5, high: 1.1},
  {card: '5', value: 5, low: 2.6, high: 1.3},
  {card: '6', value: 6, low: 2.1, high: 1.5},
  {card: '7', value: 7, low: 1.7, high: 1.7},
  {card: '8', value: 8, low: 1.5, high: 2.1},
  {card: '9', value: 9, low: 1.3, high: 2.6},
  {card: '10', value: 10, low: 1.1, high: 3.5},
  {card: 'Jack', value: 11, low: 1.1, high: 5.3},
  {card: 'Queen', value: 12, low: 1.1, high: 10.7},
  {card: 'King', value: 13, low: nil, high: nil}
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
