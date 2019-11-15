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

  def initialize
    intro
  end


  def intro
    puts "\nWhat is your name?"
    @name = gets.strip.capitalize
    puts "\nHow much money would you like to deposit into your wallet?"
    @wallet = gets.to_i
    View.menu
  end

  def view_wallet
    puts @wallet
  end

  
end

class View

  def self.menu
    puts "\nHello #{name}! How would you like to spend your money?"

    puts "\n1: Games"
    puts "2: Place Bets"
    puts "3: View Your Wallet"
    puts "4: Exit the Casino"

    case choice = gets.to_i
    when 1
      game_menu
    when 2
      puts "Go to bets"
    when 3
      view_wallet
      menu
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
    when 2
      puts "Goes to Slots"
    when 3
      puts "Goes to High / Low"
    when 4
      menu
    else
      puts "Invalid Choice. Try Again"
      game_menu
    end

  end

  def bet_menu
  end
end


User.new.intro
