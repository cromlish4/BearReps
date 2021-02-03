class DeckMaker
  numbers = [1,2,3]
  color = %w[R G P]
  shapes = %w[*, 0, ~]
  shading = [' ', '<', '/']


  var deck = Array.new(81)
  int cardsLeft
  attr_accessor :deck, :cardsLeft
  #Initialize the deck to have 81 unique cards.
  def initialize
    int w = 0
    int x = 0
    int y = 0
    int z = 0
    int count = 0

    while w < 3
      while x < 3
        while y < 3
          while z < 3
            card = Cards.new
            card.initialize numbers[w], color[x], shapes[y], shading[z]
            z+=1
            deck[count] = card
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

  end
end