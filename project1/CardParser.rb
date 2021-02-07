#Class Containing 2 methods to check cards.
# Author: Michael Cromlish
# Method 1 checks if 3 cards are part of a set.
# Method 2 checks if a card is in a deck.
class CardParsing
  #Method 1
  # setParser takes in 3 cards and checks if it is a set or not
  # returns false if cards are not in a set, true if in set.
  # cards is an Array of 3 cards
  def setParser(cards)
    #Output value of Shape
    outputValueShape = false
    #Output value of Color
    outputValueColor = false
    #Output value of Number
    outputValueNumber = false
    #Output value of Shade
    outputValueShade = false

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
    if(card1.shade == card2.shade && card1.shade == card3.shade)
      outputValueShade=true
    elsif(card1.shade != card2.shade && card1.shade != card3.shade &&
      card2.shade != card3.shade)
      outputValueShade=true
    end
    #Otherwise false by default

    #Compares the results of check and if all pass then the cards are a set
    if(outputValueShape && outputValueColor && outputValueNumber && outputValueShade)
      return true
    end
    return false
  end
  #Method 2
  # deckCheck takes in a card input and a deck to check if it is in the deck
  def deckCheck(card, deck)
    cardFound = false
    # Goes though entire deck and makes cardFound true if @card is found
    deck.each { |cardTest| if card == cardTest
                             cardFound=true
                           end}
    return cardFound
  end
end