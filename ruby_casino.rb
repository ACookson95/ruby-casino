# Basic Objectives:

# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses
# Bonus Objectives:

# Ability to move to and from games
# Find a gem that allows you to play sound and find casino sounds that will play on each game change/events
# Gem discovery: go to rubygems.org and find more gems that you want to implement in your project and use
# The player should have a Wallet and the Wallet should be its own class with remove and add methods (OOP)
# Find ASCII Art and put it into your games/menus to make it more fun for the end user
# Ability to switch players (player menu, bankroll information)
# Player's bankroll persists while moving from game to game
# Player's bankroll persists if you switch to different players
# Random events occur when changing games that can increase or decrease player's bankroll
# Roulette
# Craps
# Build a card deck 
# Card games (Blackjack, Poker, Casino War, etc...)
# Any other Casino game you can think of
# Create your own game

require 'pry'
require 'colorize'
# require_relative 'Blackjack'
require_relative 'high_low'
require_relative 'slots'


@users = []

class User 

  attr_accessor :name, :wallet

  def initialize(name,wallet)
    @name = name
    @wallet = wallet
  end

  def wallet
    @wallet
  end

  def name
    @name
  end

end

def intro
  puts "\nHow old are you?"
  age = gets.to_i
  if age < 21
    puts "Lol nice try."
    exit          #potentially we could have this go somewhere else other than a casino.
  elsif age >= 21
    puts "\n"

    puts "               .     '     ,    ".colorize(:red)
    puts "                 _________      ".colorize(:red)
    puts "            _   /_|_____|_\\   _ ".colorize(:red)
    puts "                '. \\   / .'     ".colorize(:red)
    puts "                  '.\\ /.'       ".colorize(:red)
    puts "                    '.'         ".colorize(:red)
    puts " =========================================".colorize(:red)
    puts "||     Welcome to the RUBY CASINO!       ||".colorize(:red)
    puts " =========================================".colorize(:red)
    puts "\n"
    create_user
  else
    puts "What the freak? I don't believe you"
    intro
  end
end

def create_user
  puts "\nCreate Your Profile:"
  puts "\nWhat is your name?"
  name = gets.strip.capitalize.to_s
  if name.to_s.strip.empty?
    puts "That's not a name."
    create_user
  end
  puts name
  puts "\nHow much money would you like to deposit into your wallet?"
  print '$'
  wallet = gets.to_i
  @user = User.new(name,wallet)
  @users << @user
  menu
end

def menu
  puts "\n=======================================================================".colorize(:red)
  puts "\nHello #{@user.name}! How would you like to spend your money?"
  puts "\n1: Games"
  puts "2: Manage Your Wallet"
  puts "3: Switch Users"
  puts "4: Cash Out and Exit the Casino"

  case choice = gets.to_i
  when 1
    game_menu
  when 2
    manage_wallet
  when 3
    switch_users
  when 4
    cash_out
    exit
  else 
    puts "Invalid Choice. Try Again"
    menu
  end
end

def game_menu
  puts "\n=======================================================================".colorize(:red)
  puts "\nGame Menu:"
  puts "1: Black Jack"
  puts "2: Slots"
  puts "3: High / Low"
  puts "4: Main Menu"

  case choice = gets.to_i
  when 1
    black_jack                #replace this with how you are calling blackjack
  when 2
    slots               #replace this with how you are calling slots
  when 3
    high_low               #replace this with how you are calling high / low
  when 4
    menu
  else
    puts "Invalid Choice. Try Again"
    game_menu
  end

end

def manage_wallet                       #update @user.wallet to update the user's wallet amount.
  current_wallet = @user.wallet
    puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".colorize(:green)
    puts "\nYour current balance in your wallet is: $#{current_wallet}".colorize(:green)
    puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".colorize(:green)
    puts "\nSelect an Option:"
    puts "1: Add to Wallet:"
    puts "2: Cash Out"
    puts "3: Back to Main Menu"
  
    case choice = gets.to_i
    when 1
      puts "How much would you like to deposit?"
      print '$'
      deposit = gets.to_i
      @user.wallet += deposit
      manage_wallet
    when 2 
      cash_out
      manage_wallet
    when 3
      menu
    else
      puts "Invalid Choice. Try Again"
      manage_wallet
    end
end

def cash_out
  puts "\n=======================================================================".colorize(:red)
  puts "\n"
  puts"                    ██████"
  puts"                   ████████ █"
  puts"               ██████████████"
  puts"               █████████████"
  puts"                ███████████"
  puts"                 ██████████"
  puts"                  ████████"
  puts"                  ▐██████"
  puts"                  ▐██████"
  puts"                   ▌    ▌"
  puts"                 ███ █████"
  puts"              ████████████████"
  puts"           ████████████████████"
  puts"          ████████████   ███████"
  puts"         ███████████        ███████"
  puts"        ████████████  ██ ███████████"
  puts"      ██████████████         ████████"
  puts"     ████████████████     █   █████████"
  puts"    ████████████████████  ██   █████████"
  puts"    █████████████████████  ██   ██████████"
  puts"   ██████████████████████  ██   ██████████"
  puts"  ████████████████████████      ██████████"
  puts"  ███████████████████          ███████████"
  puts"   ██████████████████       ██████████████"
  puts"   ███████████████████████  █████████████"
  puts"    █████████████████████████████████████"
  puts"     ██████████████████████████████████"
  puts"       ██████████████████████████████"
  puts"         ██████████████████████████"
  puts"              ███████████████"
  puts "\nDang. Look at all those fat stacks."
  puts "You just cashed out $#{@user.wallet}!!\n".colorize(:green)
  @user.wallet = 0
end

def switch_users
  puts "\n=======================================================================".colorize(:red)
  puts "\nSwitch User:"
  puts "\n1: Switch to an existing user"
  puts "2: Create a new profile"
  puts "3: Go back to menu"

  case choice = gets.to_i
    when 1
      existing_user
    when 2
      create_user
    when 3
      menu
    else
      puts "Invalid Choice. Try Again"
      switch_users
  end
end

def existing_user
  puts "\nWhat is your name?"
  name = gets.strip.capitalize
  if name == @user.name
    puts "You're already signed in dummy"
    switch_users
  end
  @users.each {|x| 
  if name == x.name
    @user = x
    menu
  end
  }
  puts "\nNo user by that name exists. Would you like to create a new user? (y/n)"
  choice = gets.strip
  if choice == 'y'
    create_user
  else
    switch_users
  end
end

def place_bet    
  puts "\nHow much would you like to bet? You have $#{@user.wallet} in your wallet."
   print "$"
   @bet = gets.to_i
  if @bet < @user.wallet
    @user.wallet -= @bet
  elsif @bet == @user.wallet
    puts "All in. Nice!"
    @user.wallet -= @bet
  else
    puts "You don't have that much money in your wallet." 
    puts "Would you like to quit and manage your wallet? (y/n)"
    choice = gets.strip
    if choice == 'y'
      manage_wallet
    else 
      place_bet
    end
  end
end

intro