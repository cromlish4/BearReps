/* Author: Ryan O'Donovan
 * Represents the physical play space */

	var boardMaker = { };

	boardMaker.protoype = deckMaker;

	boardMaker.constructor = New;


	/* New is boardMaker's constructor, convention to capitalize	*/


	function New {

		this.board = new Array(12);
		this.deck = this.newDeck();

		this.score = 0;

		this.deck.shuffle();

		var x = 0;

		while (x < 12){
			
			this.board[x] = this.deck.returnOne(); 

			x += 1;
		}


	}

	

	function dispayBoard {
		// This will be implemented once HTML is established //
	

	}




	


	var setOnBoard = function {

		var headIndex = 0;
		var nextIndex = 1;
		var latestIndex = 2;

	/ Move each head around the board to check all combinations/

		while (headIndex < this.length) {
			while (nextIndex < this.length) {
				while (latestIndex < this.length) {

					var result = cardParser.setParser(this.board[headIndex], 
						this.board[nextIndex], this.board[latestIndex]) 

					if (result) return true;


					latestIndex +=1;
			
				}

				nextIndex += 1;

				latestIndex = (nextIndex + 1);

			}

			headIndex += 1;
			nextIndex = (headIndex + 1);
			latestIndex = (nextIndex + 1);

		}

		return false;

	}

	function replenishCards {

		var i = 0;

		while(i < 3) {

			var newCard = this.deck.returnOne;

			this.board.push(newCard);

			i += 1;

		}

	}


	function removeEntry(cards) {


	/* Since we have all unique cards, there is no need to have an if block
	 * to see if this card is in the array.					*/

		var card1 = this.board.indexOf(cards[0]);
		var card2 = this.board.indexOf(cards[1]);
		var card3 = this.board.indexOf(cards[2]);

		this.board.splice(card1, 1);
		this.board.splice(card2, 1);
		this.board.splice(card3, 1);

	}

	boardMaker.hasSet = setOnBoard;
	boardMaker.replenish = replenishCards;
	boardMaker.remove = removeEntry;
