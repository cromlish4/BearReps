
# main class
# Eric Young

class main

  puts "Welcome to Set!\n"  # Welcome message
  puts """Game rules:
  The deck consists of 81 unique cards that vary in 4 features across 3 possibilities for each kind of feature:
  number of shapes (1, 2, 3)
  color (red, green, or purple)
  shading (solid, striped, open)
  shape (diamond, squiggle, oval)
  Each possible combination of features (e.g. a card with 3 striped gree diamonds) appears as a card precisely once in the deck.
  A SET must be either all the same or all different in each individual feature. In other words, if 2 cards are the same and 1 card is different in any feature, then it is NOT a SET (e.g. if 2 are red and 1 is purple then it is NOT a SET).
  In the game, the deck is shuffled and 12 cards are laid face up on the table. When a player finds a SET among these 12 cards, the SET will be removed and the player gets 1 point. Then 3 new cards from the deck will be added to replenish the cards on the table. If there is no SET on the table, 3 cards from the deck will be added one time until there is a SET.\n""" # Game rules
  puts """Input instructions:
  Number of shapes: '1', '2', '3'
  Color: 'R', 'G', 'P' stand for red, gree, purple respectively
  Shading: ' ', '<', '/' represent open, solid, striped
  Shape: '*', '0', '~' represent diamond, oval, squiggle respectively
  Example input: \"1R 0 2G<* 3P/~\" means a card with 1 red open oval, a card with 2 green solid diamond, and a card with 3 purple striped squiggle.
  Notice: Please follow the order of number of shapes, color, shading, and shape to specify a card!\n"""  # Input format

  @@points = 0  # Initialize user points

  while deck.cardLeft != 0
    board.display
    
    prints "Please enter a SET or NONE if no SET exists:"
    input = gets  # Get user input as a string

    # Check if the input is valid TODO: Need vaidInput method
    while !validInput(input)
      prints "Invalid input."
      input = gets
    end

    # Evaluate the input
    if input == "NONE"  # The player claims to find no SET
      if board.hasSET # The board has a SET TODO: Need hasSET from the board class
        puts "There is a SET and you missed it."
      else  # The board doesn't have a SET
        board.replenish # TODO: Need replenish method from the board class
      end
    else
      c1 = input.slice 0, 4 # Get the string that describes 1st card
      c2 = input.slice 5, 4 # Get the string that describes 2nd card
      c3 = input.slice 10, 4  # Get the string that describes 3rd card
      
      cards = Array.new(3)  # Create an array for 3 card objects
      # Initialize each card object
      cards[0].initialize(c1.slice 0 1, c1.slice 1 1, c1.slice 2 1, c1.slice 3 1)
      cards[1].initialize(c2.slice 0 1, c2.slice 1 1, c2.slice 2 1, c2.slice 3 1)
      cards[2].initialize(c3.slice 0 1, c3.slice 1 1, c3.slice 2 1, c3.slice 3 1)
      # Evaluate the SET
      if setParser(cards)
        @@points += 1
        puts "You found a SET and got 1 point!"
        board.remove(cards) # TODO: Need remove method from the board class
        board.replenish # TODO: Need replenish method from the board class
      else
        puts "Fail to find the SET. No point rewarded." # TODO: Instead of -1 point for not finding an existing SET, I think we can reward nothing so we can avoid the case where 0 - 1 < 0.
      end
  end

  print "Thanks for playing. Your final points: " + @@points
