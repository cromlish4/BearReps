# Author: Ryan O'Donovan


class BoardMaker


require_relative DeckMaker
require_relative CardParsing

attr_accessor :score, :board, :deck

  def initialize

  @board = Array.new 12
    
  @deck = DeckMaker.new

  @score = 0


    @deck.shuffle

    x = 0

    until x = 12

    @board[x] = deck.returnOne

      x += 1

    end
  
  end

  def display

  x = 0

  i = 1

  until x = @board.length

    if i < 3 

      message = "%-15s" %[@board[x]]

      puts message

      x += 1

      i += 1

    else

      message = "%-15s\n" %[@board[x]]

      x += 1

      i = 1

    end

  end

  message = "Score: %d  | Cards Left: %d\n", %[@score]

  puts message

end


def hasSet

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
  

# Since for loops go over EACH index of an array, I'll split the columns into 
  # separate arrays.
 
  input = Array.new 3

  
  size = @board.length


  column_ size = @board.length / 3


  column_x = Array.new column_size
  column_y = Array.new column_size
  column_z = Array.new column_size


  result = false

  i = 0
  j = 0

  until i = size

    column_x[j] = @board[i]

    i += 1

    column_y[j] = @board[i]

    i += 1

    column_z[j] = @board[i]

    i += 1
    j += 1

  end

  i = 0
  j = 0
  k = 0


  while result = false

    until x = column_size

      until y = column_size

        until z = column_size

          input[0] = column_x[x]
          input[1] = column_y[y]
          input[2] = column_z[z]

          result =  CardParsing::setParser(input)

          z+=1
    
         end


        y+=1

       end


      x+=1

   end

  end

  return result

  end


def replenish

 i = 0

 until i = 3

  newcard = @deck.returnOne

  @board.push newcard

  i += 1

 end

end



def remove(cards)

  i = 0

 @board - cards



end


