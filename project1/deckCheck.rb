# deckCheck takes in a card input and a deck to check if it is in the deck
def deckCheck(card, deck)
  cardFound = false
  # Goes though entire deck and makes cardFound true if @card is found
  deck.each { |cardTest| if card == cardTest
                           cardFound=true
                         end}
  return cardFound
end
