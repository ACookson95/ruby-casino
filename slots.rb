@slots_symbols = [ "cherry", "-bells", "--bar-", "-seven", "-lemon"]
@play_cost = 1
@free_drinks = 20
@jackpot_win = 1000
@seven_win = 70
@fancy_meal = 50
@slot_lines = 1

def slots
puts "\n=======================================================================".colorize(:yellow)
puts "WELCOME TO"
puts "HOT SHOTS-SLOTS".colorize(:red)
puts "\n"
puts "1) Pull the lever! (-$1)".colorize(:cyan)
puts "2) Pick lines to play".colorize(:cyan)
puts "2) Go back to the game menu".colorize(:cyan)
puts "4) Check wallet".colorize(:green)
puts "\n=======================================================================".colorize(:yellow)
menu_choice = gets.strip.to_i
case menu_choice
when 1
    @user.wallet -= @play_cost
    machine_calc
when 2 
    slot_number
when 3
    game_menu
when 4
    puts "Your current balance is #{@user.wallet}".colorize(:green)
    slots
else 
    puts "\n"
    puts "Not an option, hot-shot".colorize(:red)
    puts "\n"
    slots
end
end

def slot_number
puts "\n"
puts "How many lines would you like to play?"
puts "(Each line costs a dollar, but can multiply your winnings)"
puts "\n"
puts "1 line".colorize(:cyan)
puts "2 lines (Winning amount x2)".colorize(:cyan)
puts "3 lines (Winning amount x3)".colorize(:cyan)
puts "\n"
slot_choice = gets.strip.to_i
case slot_choice
when 1
    @user.wallet -= @play_cost
    @slot_lines = 1
    machine_calc
when 2
    @slot_lines = 2
    @user.wallet -= 2
    machine_calc
when 3
    @user.wallet -= 3
    @slot_lines = 3
    machine_calc
else 
    puts "\n"
    puts "Not an option, hot-shot".colorize(:red)
    puts "\n"
    slot_number
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
    puts" |====_________====|".colorize(:yellow)
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
        winning_ammount = (@free_drinks*@slot_lines)
        @user.wallet += winning_ammount
        puts"\n=======================================================================".colorize(:yellow)
        puts"You won free drinks at the bar (Worth $#{winning_ammount})!".colorize(:red)
        puts"\n"
        puts"                                 o".colorize(:cyan)
        puts"                              .".colorize(:cyan)
        puts"                             . o".colorize(:cyan)
        puts"       .   ,      .          o__".colorize(:cyan)
        puts"           L'  o    .----.   (==)".colorize(:cyan)
        puts"            ||_    / (--> |  |~~|".colorize(:cyan)
        puts"        o  .| ''--.)_>_=/_(  |  |".colorize(:cyan)
        puts"      .      ' )`-._/|_,(    |  |".colorize(:cyan)
        puts"          o  _| ' (_   ( |  /|()|".colorize(:cyan)
        puts"        o . ,  `.| ) '_/'| /'    '".colorize(:cyan)
        puts"       ____/ ;`__/|   (__'|'      '|".colorize(:cyan)
        puts"      |===/, ==|======/==||  ____  |".colorize(:cyan)
        puts"      | _,' o . '-..-' o |||`    `||".colorize(:cyan)
        puts"       `'-.__  o'  __.-'` || ____ ||".colorize(:cyan)
        puts"             `'..'`       ||`    `||".colorize(:cyan)
        puts"               ||         ||PARTY!||".colorize(:cyan)
        puts"               ||         || 2000 ||".colorize(:cyan)
        puts"           jgs ||         | '____' |".colorize(:cyan)
        puts"            _.'  '._      |        |".colorize(:cyan)
        puts"           <________>     |_.-__-._|".colorize(:cyan)
        puts"\n"
        puts"\n=======================================================================".colorize(:yellow)
        slots
    elsif @slot_1 == "cherry" || @slot_1 == "lemon"
        winning_ammount = (@fancy_meal*@slot_lines)
        @user.wallet += winning_ammount
        puts "\n=======================================================================".colorize(:green)
        puts "You won a fancy meal (Worth $#{winning_ammount})!".colorize(:red)
        puts "\n"
        puts "              _".colorize(:blue)
        puts "         _    H".colorize(:blue)
        puts "        | |  / ' ".colorize(:blue)
        puts "     |( | | | .-|".colorize(:blue)
        puts "    OOOO| | | |_|".colorize(:blue)
        puts " ___OOOO|_|_|___|_".colorize(:blue)
        puts "|____OO___________|".colorize(:purple)
        puts "j/ / / / / / / / /|".colorize(:yellow)
        puts "g / / / / / / / / |".colorize(:yellow)
        puts "s/ / / / / / / / /|".colorize(:yellow)
        puts "| / / / / / / / / |".colorize(:yellow)
        puts " `'============='`".colorize(:yellow)
        puts "\n=======================================================================".colorize(:green)
        slots
    elsif @slot_1 == "-seven"
        winning_ammount = (@seven_win*@slot_lines)
        @user.wallet += winning_ammount
        puts "\n=======================================================================".colorize(:yellow)
        puts "\n"
        puts "Lucky seven! You win $#{winning_ammount} dollars!".colorize(:red)
        puts "\n"
        puts"                 ***....**     **...***".colorize(:green)
        puts"                **........** **.......**".colorize(:green)
        puts"         ***    **..........*.........**    ***".colorize(:green)
        puts"      **.....**  **..................**  **.....**".colorize(:green)
        puts"    **.........**  **..............**  **.........**".colorize(:green)
        puts"   *..............*   *..........*   *..............*".colorize(:green)
        puts"    **..............*   *......*   *..............**".colorize(:green)
        puts"      **..............** *....* **..............**".colorize(:green)
        puts"        *......................................*".colorize(:green)
        puts"      **..............**........**..............**".colorize(:green)
        puts"    **..............*    *....*....*..............**".colorize(:green)
        puts"   *..............*    *........* ...*..............*".colorize(:green)
        puts"    **.........**    *............* ...**.........**".colorize(:green)
        puts"      **.....**   **...............**....**.....**".colorize(:green)
        puts"         ***    **...................**...*  ***".colorize(:green)
        puts"              **...........*...........**...*".colorize(:green)
        puts"               **.........* *.........**  *...*..*..*..*".colorize(:green)
        puts"                 *......**   **......*      *........*".colorize(:green)
        puts"                   **  *       * **            *...*".colorize(:green)
        puts"\n"                                                 
        puts "\n=======================================================================".colorize(:yellow)
        slots
    elsif @slot_1 == "-bells"
        winning_ammount = (@jackpot_win*@slot_lines)
        @user.wallet += winning_ammount
        puts "\n=======================================================================".colorize(:cyan)
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
        puts"                  You won the Jackpot with $#{winning_ammount}!!!".colorize(:red)
        puts "\n=======================================================================".colorize(:cyan)
        slots
    else
        slots
    end           
end