@slots_symbols = [ cherry, bells, bar, seven]

def @slots
puts "WELCOME TO".colorize(:yellow)
puts "HOT SLOTS".colorize(:red)
puts "/n"
            #                   ".-------."
            #                   "|Jackpot|"
            #       "____________|_______|____________"
            #      "|  __    __    ___  _____   __    |"  
            #      "| / _\  / /   /___\/__   \ / _\   |" 
            #      "| \ \  / /   //  //  / /\ \\ \  25|" 
            #      | _\ \/ /___/ \_//  / /  \/_\ \ []| 
            #      | \__/\____/\___/   \/     \__/ []|
            #      |===_______===_______===_______===|
            #      ||*|\_     |*| _____ |*|\_     |*||
            #      ||*|| \ _  |*||     ||*|| \ _  |*||
            #      ||*| \_(_) |*||*BAR*||*| \_(_) |*||
            #      ||*| (_)   |*||_____||*| (_)   |*|| __
            #      ||*|_______|*|_______|*|_______|*||(__)
            #      |===_______===_______===_______===| ||
            #      ||*| _____ |*|\_     |*|  ___  |*|| ||
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

menu
end

def menu
puts "1) Pull the lever (-$1)"
puts "2) Go back to the game menu"
puts "3) Check wallet"

menu_choice = gets.strip.to_i
case menu_choice
when 1
    machine_calc
when 2
    game_menu
when 3
    #
end 

def machine_calc(slot_1, slot_2, slot_3)
    slot_1 = slots_symbols.shuffle.first
    slot_2 = slots_symbols.shuffle.first
    slot_3 = slots_symbols.shuffle.first

    puts "/n"
    puts "|====_________====|"
    puts "||*|           |*||"
    puts "||*| #{slot_1} |*||"
    puts "||===_________===||"
    puts "||*|           |*||"
    puts "||*| #{slot_2} |*||"
    puts "||===_________===||"
    puts "||*|           |*||"
    puts "||*| #{slot_3} |*||"
    puts "||*|___________|*||"
    puts "/n"

    if slot_1==slot2 && slot_2==slot_3 
        #win
    elsif slot_1==slot_2 | slot_3==slot_1 | slot_2==slot_3
        "So close!"
        menu
    else
        "Next time!"
        menu
    end
  end

def winnings
    if slot_1 == @slots_symbols(bar)
    puts "You won a free drink."
    puts "/n"    
                  puts"@".colorize(:green)
                 puts"/"
      puts".----------."
       puts"\~~~~~~~~/"
        puts"\      /"
         puts"\    /"
          puts"\  /"
           puts"\/"
           puts"||"
           puts"||"
      puts".---------."
       puts "/n"
    elsif slot_1 == @slots_symbols(cherry)
        puts "Free food"
        # picutre
        menu
    else slot_1 == @slots_symbols(bells)
        puts "Jackpot!"
        menu
    end           
end

@slots 

