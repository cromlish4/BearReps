#Author: Andrew Connors
class DeckMaker

  $numbers = [1,2,3]
  $color = %w[R G P]
  $shapes = %w[*, 0, ~]
  $shading = [' ', '<', '/']


  $deck = Array.new(81)
  int cardsLeft
  attr_accessor :deck, :cardsLeft
  #Initialize the deck to have 81 unique cards.
  def initialize
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
            #This line should import cards class
            require_relative 'Cards'
            card = Cards.new
            card.initialize $numbers[w], $color[x], $shapes[y], $shading[z]
            z+=1
            @deck[count] = card
            count+=1
          end
          y+=1
        end
        x+=1
      end
      w+=1
    end
    cardsLeft = 81
  end

  #Return the number of cards remaining in the deck
  def cardsLeft
    return @cardsLeft
  end

  #Check to see if a given card is in the deck
  def checkCard(number, color, shapes, shading)
    x = 0
    while x < 81
      if deck[x].color == color && deck[x].numbers == number && deck[x].shapes == shapes && deck[x].shading == shading
        return true
      end
      x+=1

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