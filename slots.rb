@slots_symbols = [ "cherry", "-bells", "--bar-", "-seven" ]

def slots
puts "WELCOME TO"
puts "HOT SLOTS"
puts "\n"
puts "1) Pull the lever (-$1)"
puts "2) Go back to the game menu"
puts "3) Check wallet"
puts "\n"
menu_choice = gets.strip.to_i
case menu_choice
when 1
    machine_calc
when menu_choice == 2
    game_menu
when menu_choice == 3
    puts "Your current balance is #{@user.wallet}"
    slots
else 
    puts "\n"
    puts "Not an option, buddy"
    puts "\n"
    slots
end
end
            #                   ".-------."
            #                   "|Jackpot|"
            #       "____________|_______|____________"
            #      "|  __    __    ___  _____   __    |"  
            #      "| / _\  / /   /___\/__   \ / _\   |" 
            #      "| \ \  / /   //  //  / /\ \\ \  25|" 
            #      "| _\ \/ /___/ \_//  / /  \/_\ \ []|" 
            #      "| \__/\____/\___/   \/     \__/ []|"
            #      "|===_______===_______===_______===|"
            #      "||*|\_     |*| _____ |*|\_     |*||"
            #      "||*|| \ _  |*||     ||*|| \ _  |*||"
            #      "||*| \_(_) |*||*BAR*||*| \_(_) |*||"
            #      "||*| (_)   |*||_____||*| (_)   |*|| __"
            #      "||*|_______|*|_______|*|_______|*||(__)"
            #      "|===_______===_______===_______===| ||"
            #      "||*| _____ |*|\_     |*|  ___  |*|| ||"
            #      ||*||     ||*|| \ _  |*| |_  | |*|| ||
            #      ||*||*BAR*||*| \_(_) |*|  / /  |*|| ||
            #      ||*||_____||*| (_)   |*| /_/   |*|| ||
            #      ||*|_______|*|_______|*|_______|*||_//
            #      |===_______===_______===_______===|_/
            #      ||*|  ___  |*|   |   |*| _____ |*||
            #      ||*| |_  | |*|  / \  |*||     ||*||
            #      ||*|  / /  |*| /_ _\ |*||*BAR*||*||              
            #      ||*| /_/   |*|   O   |*||_____||*||        
            #      ||*|_______|*|_______|*|_______|*||
            #      |lc=___________________________===|
            #      |  /___________________________\  |
            #      |   |                         |   |
            #     _|    \_______________________/    |_
            #    (_____________________________________)

def machine_calc
    # @user.wallet -= 1

    @slot_1 = @slots_symbols.shuffle.first
    @slot_2 = @slots_symbols.shuffle.first
    @slot_3 = @slots_symbols.shuffle.first
    puts "\n"
    puts "\n"
    puts "|====_________====|"
    puts "||*|           |*||"
    puts "||*|--#{@slot_1}---|*|| (_)"
    puts "||===_________===||  |"
    puts "||*|           |*||  |"
    puts "||*|--#{@slot_2}---|*||_/"
    puts "||===_________===||"
    puts "||*|           |*||"
    puts "||*|--#{@slot_3}---|*||"
    puts "||*|___________|*||"
    puts "\n"
    puts "\n"

    if @slot_1 == @slot_2 && @slot_2 == @slot_3 
        winnings
    elsif @slot_1 == @slot_2 || @slot_3 == @slot_1 || @slot_2 == @slot_3
        puts "\n"
        puts "So close!"
        puts "\n"
        slots
    else
        puts "\n"
        puts "Next time!"
        puts "\n"
        slots
    end
  end

def winnings
    if @slot_1 == "--bar-"
         puts "You won a free drink."    
         slots
    elsif @slot_1 == "cherry"
        puts "You won a free meal!"
        slots
    elsif @slot_1 == "-seven"
        puts "You win seventy dollars!"
        # @user.wallet += 70
        slots
    elsif @slot_1 == "-bells"
        puts "Jackpot!"
        # @user.wallet += 1000
        slots
    else
        slots
    end           
end