/* Author: Ryan O'Donovan
 * Represents the physical play space */

	import './CardParser.js';

	import * as Deck from './deck-maker.js';

	class BoardMaker {


	/* New is boardMaker's constructor, convention to capitalize	*/


	function New() {

		this.board = new Array(12);
		deck = new Deck();

		this.score = 0;

		deck.shuffle();

		var x = 0;

		while (x < 12){
			
			this.board[x] = deck.returnOne(); 

			x += 1;
		}


	}

	

	function dispayBoard() {
		

		var i = 0;

		var length = this.board.length;

		var tr;


		while(i < length){

			tr += "<tr>";

			tr += "<td>" + this.board[i]+ "</td>";

			i += 1;

			tr += "<td>" + this.board[i]+ "</td>";

                        i += 1;

			tr += "<td>" + this.board[i]+ "</td>";

                        i += 1;

			tr += "</tr>";

		}

		tr += "</tr>";


		var table = document.getElementById("playing-field");

		table.innerHTML = tr;
		



	}




	


	function hasSet() {

		var headIndex = 0;
		var nextIndex = 1;
		var latestIndex = 2;

	/ Move each head around the board to check all combinations/

		while (headIndex < this.length) {
			while (nextIndex < this.length) {
				while (latestIndex < this.length) {

					var result = setParser(this.board[headIndex], 
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

	function replenishCards() {

		var i = 0;

		while(i < 3) {

			var newCard = deck.returnOne;

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

}
