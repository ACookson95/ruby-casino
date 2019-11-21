

@slots_symbols = [ "cherry", "-bells", "--bar-", "-seven" ]
@play_cost = 1
@jackpot_win = 1000
@seven_win = 70

def slots
puts "\n=======================================================================".colorize(:yellow)
puts "WELCOME TO"
puts "HOT SHOTS-SLOTS".colorize(:red)
puts "\n"
puts "1) Pull the lever (-$1)".colorize(:cyan)
puts "2) Go back to the game menu".colorize(:cyan)
puts "3) Check wallet".colorize(:green)
puts "\n=======================================================================".colorize(:yellow)
menu_choice = gets.strip.to_i
case menu_choice
when 1
    @user.wallet -= @play_cost
    machine_calc
when 2
    game_menu
when 3
    puts "Your current balance is #{@user.wallet}".colorize(:green)
    slots
else 
    puts "\n"
    puts "Not an option, hot-shot".colorize(:red)
    puts "\n"
    slots
end
end

def machine_calc
    @slot_1 = @slots_symbols.shuffle.first
    @slot_2 = @slots_symbols.shuffle.first
    @slot_3 = @slots_symbols.shuffle.first
    puts"\n"
    puts"\n"
    puts"      .-------.".colorize(:yellow)
    puts"      |HotShot|".colorize(:red)
    puts" |====_________====|".colorize(:cyan)
    puts" ||*|           |*||".colorize(:cyan)
    puts" ||*|--#{@slot_1}---|*|| (_)".colorize(:cyan)
    puts" ||===_________===||  |".colorize(:cyan)
    puts" ||*|           |*||  |".colorize(:cyan)
    puts" ||*|--#{@slot_2}---|*||_/".colorize(:cyan)
    puts" ||===_________===||".colorize(:cyan)
    puts" ||*|           |*||".colorize(:cyan)
    puts" ||*|--#{@slot_3}---|*||".colorize(:cyan)
    puts" ||*|___________|*||".colorize(:cyan)
    puts"(___________________)".colorize(:yellow)
    puts "\n"
    puts "\n"

    if @slot_1 == @slot_2 && @slot_2 == @slot_3 
        winnings
    elsif @slot_1 == @slot_2 || @slot_3 == @slot_1 || @slot_2 == @slot_3
        puts "\n"
        puts "So close!".colorize(:red)
        puts "\n"
        slots
    else
        puts "\n"
        puts "Next time!".colorize(:red)
        puts "\n"
        slots
    end
  end

def winnings
    if @slot_1 == "--bar-"
        puts "You won a free drink.".colorize(:red)
        puts "\n" 
        slots
    elsif @slot_1 == "cherry"
        puts "You won a free meal!".colorize(:red)
        puts "\n"
        slots
    elsif @slot_1 == "-seven"
        puts "You win seventy dollars!".colorize(:red)
        puts "\n"
        @user.wallet += @seven_win
        slots
    elsif @slot_1 == "-bells"
        puts"\n"
        puts"                              .-------.".colorize(:yellow)
        puts"                              |HotShot|".colorize(:red)
        puts"                  ____________|_______|____________".colorize(:yellow)
        puts"                 |    __  __    ___ ______   ___   |".colorize(:yellow)  
        puts"                 |  / __|/ /   /___|__   _|/ ___|  |".colorize(:yellow) 
        puts"                 |  | | / /   //  // / /  | |    $1|".colorize(:yellow) 
        puts"                 | _' |/ /___/ |_// / / __/ /    |||".colorize(:yellow)
        puts"                 ||__/|____//___// /_/ |___/     |||".colorize(:yellow)
        puts"                 |===_______===_______===_______===|".colorize(:yellow)
        puts"                 ||*||_     |*| _____ |*||_     |*||".colorize(:cyan)
        puts"                 ||*|| | _  |*||     ||*|| | _  |*||".colorize(:cyan)
        puts"                 ||*| '_(_) |*||*BAR*||*| '_(_) |*||".colorize(:cyan)
        puts"                 ||*| (_)   |*||_____||*| (_)   |*|| __".colorize(:cyan)
        puts"                 ||*|_______|*|_______|*|_______|*||(__)".colorize(:cyan)
        puts"                 |===_______===_______===_______===| ||".colorize(:cyan)
        puts"                 ||*| _____ |*||_     |*|  ___  |*|| ||".colorize(:cyan)
        puts"                 ||*||     ||*|| | _  |*| |_  | |*|| ||".colorize(:cyan)
        puts"                 ||*||*BAR*||*| '_(_) |*|  / /  |*|| ||".colorize(:cyan)
        puts"                 ||*||_____||*| (_)   |*| /_/   |*|| ||".colorize(:cyan)
        puts"                 ||*|_______|*|_______|*|_______|*||_//".colorize(:cyan)
        puts"                 |===_______===_______===_______===|_/".colorize(:cyan)
        puts"                 ||*|  ___  |*|   |   |*| _____ |*||".colorize(:cyan)
        puts"                 ||*| |_  | |*|  / '  |*||     ||*||".colorize(:cyan)
        puts"                 ||*|  / /  |*| /_ _' |*||*BAR*||*||".colorize(:cyan)             
        puts"                 ||*| /_/   |*|   O   |*||_____||*||".colorize(:cyan)       
        puts"                 ||*|_______|*|_______|*|_______|*||".colorize(:cyan)
        puts"                 |lc=___________________________===|".colorize(:yellow)
        puts"                 |  |___________________________|  |".colorize(:yellow)
        puts"                 |   |                         |   |".colorize(:yellow)
        puts"                _|    |_______________________|    |_".colorize(:yellow)
        puts"               (_____________________________________)".colorize(:yellow)
        puts"\n"
        puts"                       You won the Jackpot!!!".colorize(:red)
        puts"\n"
        @user.wallet += @jackpot_win
        slots
    else
        slots
    end           
end