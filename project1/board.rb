# Author: Ryan O'Donovan


# To Do: 
#  Create new deck (#2)
#  Create array to track board
#  Fill board with cards
#  Create function to check if cards on teh board can form a set (setPArser)
#  Remove specific cards from the board
#  Add 3 cards to the board (#2)
#  Track player score
#  Create a function to display the board, score and cards remaining.
#  The board should have 3 columns max and be separated by an even
#  amount of space if possible, else just use a comma.
#
#  EX:
#
#  Score : 2            Deck: 3
#  1R<0>   1R/0/   2G<0>
#  2R0     2G~     1P<>
#

class BoardMaker


require_relative DeckMaker

require_relative CardParsing

attr_accessor :board :sets, :playerScore, 

  def initialize

    @board = Array.new 12
    
    deck = DeckMaker.new

    deck.shuffle

    x = 0

    until x = 12

      board[x] = deck.returnOne

      x += 1

    end


end


def display

  x = 0

  i = 1

  until x = 12

    if i < 3 

      printf "%-15s", board[x]

      x += 1

      i += 1

    else

      printf "%-15s\n" , board[x]

      x += 1

      i = 1

    end

  end
      
end


def sets

  # The general idea:
  #
  # Say a board looks like this:
  #
  # card1   card2   card3
  # card4   card5   card6
  # . . .   . . .   . . .
  #
  # Then the board array would look like:
  #
  # [card1, card2, card3, card4, card5, card6 ... ]
  #
  #
  # To see if there is any set on the board, we must
  # check every possible combination of cards.
  #
  # The best way to do this is to check the first entry of each row
  # with every second and third entry of each row.
  #
  # let x be for indexing down the first entires.
  # let y be for indexing down the second entries.
  # let z be for indexing down the third entries.
  #
  # let x = 0
  # let y = 1
  # let z = 2
  #
  # so board[x] is the first entry in the first row
  # board[y] is the second entry in the first row
  # board[z] is the third entry in the first row
  #
  # to move down a row we have to look back at our picture example:
  #
  # card1 . . .
  #   |
  #   V                    <==> board[x] -> board[x+3]
  # card4 . . .
  #
  # Going down one row will always be an addition of 3, again because:
  #
  # board[card1, card2, card3, card4, card5, card6 . . .]
  #
  # So, all x values will be:
  #
  #   0, 3, 6, 9
  #
  #   all y values will be:
  #
  #   1, 4, 7, 10
  #
  #   and all z values will be:
  #
  #   2, 5, 8, 11
  #
  #
  # We can set a triple for loop up such that:
  #
  # for(x = 0; x < 9; x+=3){
  #
  #     for(y = 1; y < 10; y += 3){
  #
  #         for(z = 2; z < 11; z += 3){
  #
  #
  #             * say some array named input *
  #
  #             input[0] = x
  #             input[1] = y
  #             input[2] = z
  #
  #             * Call setParser with input *
  #
  #
  #             *Now, if setParser returns true at any point
  #
  #               we can break the loop, since we only need
  #
  #               to know if there is any set on board. *
  #
  #
  #         }
  #     }
  # }
  # 
  
  result = false
  x = 0
  y = 1
  z = 2



