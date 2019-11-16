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
  puts "Create Your Profile:"
  puts "\nWhat is your name?"
  name = gets.strip.capitalize
  puts "\nHow much money would you like to deposit into your wallet?"
  print '$'
  wallet = gets.to_i

  @user = User.new(name,wallet)
  menu
end

def menu
  puts "\n=======================================================================".colorize(:red)
  puts "\nHello #{@user.name}! How would you like to spend your money?"
  puts "\n1: Games"
  puts "2: Place Bets"
  puts "3: Manage Your Wallet"
  puts "4: Exit the Casino"

  case choice = gets.to_i
  when 1
    game_menu
  when 2
    puts "Go to bets"
    menu
  when 3
    manage_wallet
  when 4
    exit
  else 
    puts "Invalid Choice. Try Again"
    menu
  end
end

def game_menu
  puts "\nGame Menu:"
  puts "1: Black Jack"
  puts "2: Slots"
  puts "3: High / Low"
  puts "4: Main Menu"

  case choice = gets.to_i
  when 1
    puts "Goes to Black Jack"
    game_menu
  when 2
    puts "Goes to Slots"
    game_menu
  when 3
    puts "Goes to High / Low"
    game_menu
  when 4
    menu
  else
    puts "Invalid Choice. Try Again"
    game_menu
  end

end

def bet_menu
end

def manage_wallet
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
      puts "Dang. Look at all those fat stacks."
      puts "\n"
      puts"  ──────────────────██████────────────────"
      puts"  ─────────────────████████─█─────────────"
      puts"  ─────────────██████████████─────────────"
      puts"  ─────────────█████████████──────────────"
      puts"  ──────────────███████████───────────────"
      puts"  ───────────────██████████───────────────"
      puts"  ────────────────████████────────────────"
      puts"  ────────────────▐██████─────────────────"
      puts"  ────────────────▐██████─────────────────"
      puts"  ──────────────── ▌─────▌────────────────"
      puts"  ────────────────███─█████───────────────"
      puts"  ────────────████████████████────────────"
      puts"  ──────────████████████████████──────────"
      puts"  ────────████████████─────███████────────"
      puts"  ──────███████████─────────███████───────"
      puts"  ─────████████████───██─███████████──────"
      puts"  ────██████████████──────────████████────"
      puts"  ───████████████████─────█───█████████───"
      puts"  ──█████████████████████─██───█████████──"
      puts"  ──█████████████████████──██──██████████─"
      puts"  ─███████████████████████─██───██████████"
      puts"  ████████████████████████──────██████████"
      puts"  ███████████████████──────────███████████"
      puts"  ─██████████████████───────██████████████"
      puts"  ─███████████████████████──█████████████─"
      puts"  ──█████████████████████████████████████─"
      puts"  ───██████████████████████████████████───"
      puts"  ───────██████████████████████████████───"
      puts"  ───────██████████████████████████───────"
      puts"  ─────────────███████████████────────────"
      @user.wallet = 0
      manage_wallet
    when 3
      menu
    else
      puts "Invalid Choice. Try Again"
      manage_wallet
    end
end

intro