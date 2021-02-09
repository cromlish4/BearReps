
# main class
# Eric Young

class Main

  require_relative 'card.rb'
  require_relative 'board.rb'
  require_relative 'CardParser.rb'

  @board = BoardMaker.new

  # Check a string represents a single card
  def self.validCard?(card_string)
    if (["1", "2", "3"].include? card_string.slice 0, 1) && (["R", "G", "P"].include? card_string.slice 1, 1) && ([" ", "<", "/"].include? card_string.slice 2,1) && (["*", "0", "~"].include? card_string.slice 3,1)
      return true
    else
      return false
    end    
  end

  # Check if the input string is a valid representation for 3 cards
  def self.validCombination?(input)
    if input.length == 14
      c1 = input.slice 0, 4 # Get the string that describes 1st card
      c2 = input.slice 5, 4 # Get the string that describes 2nd card
      c3 = input.slice 10, 4  # Get the string that describes 3rd card
      if validCard?(c1) && validCard?(c2) && validCard?(c3)

        cardsTemp1 = Card.new((c1.slice 0, 1).to_i, (c1.slice 1, 1), (c1.slice 2, 1), (c1.slice 3, 1))
        cardsTemp2 = Card.new((c2.slice 0, 1).to_i, (c2.slice 1, 1), (c2.slice 2, 1), (c2.slice 3, 1))
        cardsTemp3 = Card.new((c3.slice 0, 1).to_i, (c3.slice 1, 1), (c3.slice 2, 1), (c3.slice 3, 1))
        board = @board.board
        #puts @board.methods
        card1Board = CardParsing.boardCheck(cardsTemp1, board)

        card2Board = CardParsing.boardCheck(cardsTemp2, board)

        card3Board = CardParsing.boardCheck(cardsTemp3, board)

        if (card1Board && card2Board && card3Board)
          return true
        else
          puts "One or more non-valid cards entered."
          return false
        end
      else
        puts "Invalid input: Illegal format or characters found."
        return false
      end
    else
      puts "Invalid input: Illegal input length."
      return false
    end
  end

  # Check if the input is valid
  def self.checkInput(input)
    if input == "NONE" || input == "exit"
      return true
    else
        validCombination?(input)
    end
  end

  # Convert the input string to an array of card objects
  # Note doesn't truly convert but finds the card with the right values in the deck.
  def self.convert(input)
    c1 = input.slice 0, 4 # Get the string that describes 1st card
    c2 = input.slice 5, 4 # Get the string that describes 2nd card
    c3 = input.slice 10, 4  # Get the string that describes 3rd card
      
    cards = Array.new(3)  # Create an array for 3 card objects
    # Initialize each card object
    cards[0] = Card.new((c1.slice 0, 1), (c1.slice 1, 1), (c1.slice 2, 1), (c1.slice 3, 1)) #changed
    cards[1] = Card.new((c2.slice 0, 1), (c2.slice 1, 1), (c2.slice 2, 1), (c2.slice 3, 1))
    cards[2] = Card.new((c3.slice 0, 1), (c3.slice 1, 1), (c3.slice 2, 1), (c3.slice 3, 1))

    i = 0
    cards.each do |card|
      cards[i] = CardParsing.convertStringToCardOnBoard(card, @board.board)
      i += 1
    end

    return cards
  end

  puts "Welcome to Set!\n"  # Welcome message
  puts """Game rules:
  The deck consists of 81 unique cards that vary in 4 features across 3 possibilities for each kind of feature:
  number of shapes (1, 2, 3)
  color (red, green, or purple)
  shading (solid, striped, open)
  shape (diamond, squiggle, oval)
  Each possible combination of features (e.g. a card with 3 striped green diamonds) appears as a card precisely once in the deck.
  A SET must be either all the same or all different in each individual feature. In other words, if 2 cards are the same and 1 card is different in any feature, then it is NOT a SET (e.g. if 2 are red and 1 is purple then it is NOT a SET).
  In the game, the deck is shuffled and 12 cards are laid face up on the table. When a player finds a SET among these 12 cards, the SET will be removed and the player gets 1 point. Then 3 new cards from the deck will be added to replenish the cards on the table. If there is no SET on the table, 3 cards from the deck will be added one time until there is a SET.\n""" # Game rules
  puts """Input instructions:
  Number of shapes: '1', '2', '3'
  Color: 'R', 'G', 'P' stand for red, green, purple respectively, Cap's ONLY!
  Shading: ' ', '<', '/' represent open, solid, striped
  Shape: '*', '0', '~' represent diamond, oval, squiggle respectively
  Example input: \"1R 0 2G<* 3P/~\" means a card with 1 red open oval, a card with 2 green solid diamond, and a card with 3 purple striped squiggle.
  Notice: Please follow the order of number of shapes, color, shading, and shape to specify a card!\nType <exit> to exit\n\n"""  # Input format

  while @board.deck.cardsLeft != 0
    @board.display
    
    puts "Please enter a SET or NONE if no SET exists:"
    input = gets.delete!("\n")  # Get user input as a string and remove new line

    # Check if the input is valid
    while !checkInput(input)
      # Error messages will be printed by lower level methods
      puts "Please enter a SET or NONE if no SET exists:"
      input = gets.delete!("\n")
    end

    # Evaluate the input
    if input == "NONE"  # The player claims to find no SET
      if @board.hasSet # The board has a SET
        puts "There is a SET and you missed it."
      else  # The board doesn't have a SET
        @board.replenish # Add 3 cards to the board
      end
    elsif input == "exit"
      break
    else
      # Convert the input string to an array of cards and valuate the SET
      cards = convert input
      if CardParsing.setParser(cards)
        puts "You found a SET and got 1 point!"
        @board.remove(cards) # Remove old cards
        @board.replenish # Add 3 more cards
        @board.score += 1 # Increment the score
      else
        puts "Not a SET, minus 1 point"
        @board.score -= 1
      end
    end
  end
  end
