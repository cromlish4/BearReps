#Author: Andrew Connors
# Represent a standard 81 card deck of set
class DeckMaker

  #This line should import cards class
  require_relative 'card.rb'
  attr_reader :deck
   $numbers = Card.getNumbers
   $colors = Card.getColors
   $shapes = Card.getShapes
   $shading = Card.getShadingTypes





  #Initialize the deck to have 81 unique cards.
  def initialize
    @deck = Array.new(81)
    w = 0
    x = 0
    y = 0
    z = 0
    count = 0

    while w < 3
      x = 0
      while x < 3
        y = 0
        while y < 3
          z = 0
          while z < 3



            nextCard = Card.new $numbers[w], $colors[x], $shading[y], $shapes[z]
            z+=1
            @deck[count] = nextCard
            count+=1
          end
          y+=1
        end
        x+=1
      end
      w+=1
    end

  end

  #Return the number of cards remaining in the deck
  def cardsLeft
    return @deck.length
  end

  #Shuffle deck
  def shuffle
      @deck.shuffle!
  end

  #Return first element in array
  def returnOne

    return @deck.shift
  end

  end
