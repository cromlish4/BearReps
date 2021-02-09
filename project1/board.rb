# Author: Ryan O'Donovan


class BoardMaker


  require_relative 'deck_maker.rb'
  require_relative 'card.rb'
  require_relative 'CardParser.rb'

attr_accessor :score, :board, :deck

  def initialize

  @board = Array.new 12
    
  @deck = DeckMaker.new

  @score = 0


    @deck.shuffle

    x = 0

    until x == 12

    @board[x] = deck.returnOne

      x += 1

    end
  
  end

  def display

  x = 0

  i = 1

  until x == @board.length

    if i < 3 

      print "%-15s" %[@board[x].return_card]

      x += 1

      i += 1

    else

      print "%-15s\n" %[@board[x].return_card]

      x += 1

      i = 1

    end

  end

  print "Score: %d   | Cards Left: %d\n" %[@score, @deck.cardsLeft]

end

  # Author : Samiul Islam
  # Check every possible combination of cards on the board to see if they make a set
def hasSet

  # [headIndex][nextIndex][latestIndex][][] --> [headIndex][nextIndex][][latestIndex][]--> [headIndex][nextIndex][][][latestIndex]
  # [headIndex][][nextIndex][latestIndex][] ... --> [][headIndex][nextIndex][latestIndex][]
  headIndex = 0
  nextIndex = 1
  latestIndex = 2

  # Move each head around the whole board to check all combinations
  until headIndex == board.length
    until nextIndex == board.length
      until latestIndex == board.length
        result =  CardParsing::setParser([board[headIndex], board[nextIndex], board[latestIndex]])
        if result
          return true
        end
        latestIndex += 1
      end

      nextIndex += 1
      latestIndex = (nextIndex+1)
    end
    headIndex += 1
    nextIndex = (headIndex+1)
    latestIndex = (nextIndex+1)
  end

  return false
end

def replenish

 i = 0

 until i == 3

  newCard = @deck.returnOne

  @board.push newCard

  i += 1

 end

end



def remove(cards)

  i = 0

  @board = @board - cards
end
end