

# require_relative 

@suites = ["Hearts","Clubs","Diamonds", "Spades"]
@values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King' 'Ace']
@deck = []
def combineCards 
  for suiteItem in @suites
    for valueItem in @values
      card = {value:valueItem, suite:suiteItem}
      puts "show me the Item"
      puts valueItem 
      puts suiteItem
      @deck << card
    end  
  end
end
def showCards
  for value in @deck

  end
end


combineCards()
showCards()
  # puts @deck.map{|x| x[:suite]}