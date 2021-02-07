#Author: Andrew Connors
class DeckMaker

  #This line should import cards class
  require_relative 'Card'
  attr_reader :deck
   $numbers = [1,2,3]
   $color = %w[R G P]
   $shapes = %w[*, 0, ~]
   $shading = [' ', '<', '/']





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



            nextCard = card.new numbers[w], colors[x], shapes[y], shading[z]
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

  #Check to see if a given card is in the deck
  def checkCard(numbers, color, shapes, shading)
    x = 0
    y = 0
    while x < 81
      if deck[x].color == color && deck[x].number == numbers && deck[x].shape == shapes && deck[x].shading == shading
        y +=1
        return true
      end
      x+=1
    end
    # If y == 0, card was not found
    if y == 0
      return false
    end

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