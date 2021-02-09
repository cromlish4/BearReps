# Class Containing 2 methods to check cards.
# Author: Michael Cromlish
# Method 1 checks if 3 cards are part of a set.
# Method 2 checks if a card is in a deck.
class CardParsing
  #Method 1
  # setParser takes in 3 cards and checks if it is a set or not
  # returns false if cards are not in a set, true if in set.
  # cards is an Array of exactly 3 cards
  def self.setParser(cards)
    #Output value of Shape
    outputValueShape = false
    #Output value of Color
    outputValueColor = false
    #Output value of Number
    outputValueNumber = false
    #Output value of Shade
    outputValueShade = false
    #Overall output
    overallOutput = false
    #Importing card Class
    require_relative 'card'

    card1 = cards.at(0)
    card2 = cards.at(1)
    card3 = cards.at(2)

    #Check for amount of shape
    if(card1.shape == card2.shape && card1.shape == card3.shape)
      outputValueShape=true
    elsif(card1.shape != card2.shape && card1.shape != card3.shape &&
      card2.shape != card3.shape)
      outputValueShape=true
    end
    #Otherwise false by default

    #Check for Color
    if(card1.color == card2.color && card1.color == card3.color)
      outputValueColor=true
    elsif(card1.color != card2.color && card1.color != card3.color &&
      card2.color != card3.color)
      outputValueColor=true
    end
    #Otherwise false by default

    #Check for amount of Number
    if(card1.number == card2.number && card1.number == card3.number)
      outputValueNumber=true
    elsif(card1.number != card2.number && card1.number != card3.number &&
      card2.number != card3.number)
      outputValueNumber=true
    end
    #Otherwise false by default

    #Check for Shade
    if(card1.shading == card2.shading && card1.shading == card3.shading)
      outputValueShade=true
    elsif(card1.shading != card2.shading && card1.shading != card3.shading &&
      card2.shading != card3.shading)
      outputValueShade=true
    end
    #Otherwise false by default

    #Compares the results of each check and if all pass then the cards are a set, else not a set
    if(outputValueShape && outputValueColor && outputValueNumber && outputValueShade)
      overallOutput = true
    end
    return overallOutput
  end

  #Method 2
  # boardCheck takes in a card input and the board to check if the card exists on the board.
  # card - single card object
  # board - any size array of card objects
  # returns True if the card is on the board.
  def self.boardCheck(card, board)
    cardFound = false
    # Goes though entire deck and makes cardFound true if @card is found
    board.each { |cardTest| if (card.shape == cardTest.shape && card.color == cardTest.color &&
      card.shading == cardTest.shading && card.number == cardTest.number)
                             cardFound=true
                           end}
    return cardFound
  end
  
  # Take an input representing 1 card as a string (1R<0>) then look through
  # the board for cards with the same feature and return the card object on the board
  # Make sure to call boardCheck first
  def self.convertStringToCardOnBoard(input, board)
    board.each {   |boardCard| if (boardCard.return_card == input.return_card)
                                return boardCard
                              end }
  end
end
