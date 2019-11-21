

# require_relative 

@suits = ["Hearts","Clubs","Diamonds", "Spades"]
@values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King' 'Ace']
@deck =[]
# k so parts of a for look are a "value" and the "enumerable"/ Enumerable just means the "List" Or "Array"
# type in the list you want to iterate over in "enumerable" so our list would be "@suites"
# take out "enumerable" the whole word and type in @suites
#k now what does a for loop do lets see
# puts what? we want what out of @suites 
# type puts item <--- type puts item the word after "puts" is "item"
#now call your method to show it on screen
# calll your method below where you typed "ohhh" # do it again
#run it good job its named wrong type it no not that! @suits fix one
# you see how it iterates of the "item"
# dont we want to see values? @value == @values?
# good job now do you think we can get hearts to show on the same line as the value?
# now thats two for loops this is correct execpt for one small issue however run it 
#k now lets create the deck, so first we need an empty deck right? good, now we need to push these items into the deck.....item
# we are going to have to create a card, leave the code there will use line 29 no keep that code dont duplicate no need
#how do you create a hash? before we move it into a deck we need to make a card thats the next step.... do you know how to make a hash?
# k now whats a key we dont end it, end is only for functions, no thats to search we just need to create, values: is this item or item2?
# if key was values what would the value be of that
# lets start with suite no numbers... its ether item2 or item , which one is the suit 50/50 shot, item2 or item
#k now put a , for the next thing... this one is called?????
# k we created a card!!!!, now we need to SHUVVEL as they say in ruby, so shuvveeelllll that bitch in
# so you want to call the function "createDeck" which would call itself in an infinate loop
# first start which which array is our "deck?" k now shuvvelll what into it?
#there ya go, now run it and see if it breaks, didnt break must of shuvvvveeeeellllleddddd right
# k i got to get to bed now but you have create the deck now you need to get a card value so do a function for just getting what card is in slot
# 25, after you do that then you can start to worry how to do random, player hand, dealer hand, calculating cards, chips etc.....
def createDeck
        for item2 in @suits  
          #this line right here executes first
          for item in @values
            puts item2 + ' '+ item 
            card = { suit: item2, value: item }
            @deck << card

          end
        end
      end
      
      createDeck()
      but keep your notes dnd it will help a ton
      #im not deleting anything go ahead ill see you tomorrow
      # whoa!!! thats a deck, now how do we take that and put it actually into a deck we know how to display one but now you need to create one
      # run it