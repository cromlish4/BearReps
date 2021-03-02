/* Author: Ryan O'Donovan
 * Represents the physical play space */

import imageUpdate from "./image-updater.js";
import CardParsing from "./CardParser.js";
import DeckMaker from "./deck-maker.js";

export default class BoardMaker {

	/* New is boardMaker's constructor, convention to capitalize	*/
	constructor() {

		this._board = new Array(12);
		this._deck = new DeckMaker;
		this._score = 0;

		this._deck.shuffleDeck();
		var x = 0;

		while (x < 12) {

			this._board[x] = this._deck.returnOne();

			x += 1;
		}
	}

	displayBoard() {
		// updateAllImages gives an img src to each card on the board. //
		imageUpdate.updateAllImages(this._board);
		document.getElementById("cards-left").innerHTML = this._deck.cardsLeft();
		document.getElementById("score-number").innerHTML = this._score;

	}
	// Variation of has set that returns the index of the set or -1,-1,-1.
	setLocation() {
		var headIndex = 0;
		var nextIndex = 1;
		var latestIndex = 2;
		/* Move each head around the board to check all combinations */

		while (headIndex < this._board.length) {
			while (nextIndex < this._board.length) {
				while (latestIndex < this._board.length) {

					let selectedCards = [this._board[headIndex],
						this._board[nextIndex], this._board[latestIndex]];
					var result = CardParsing.setParser(selectedCards);

					if (result) return [headIndex,nextIndex,latestIndex];

					latestIndex += 1;
				}

				nextIndex += 1;
				latestIndex = (nextIndex + 1);
			}

			headIndex += 1;
			nextIndex = (headIndex + 1);
			latestIndex = (nextIndex + 1);
		}
		//Only if not a set.
		return [-1,-1,-1];
	}

	hasSet() {
		var headIndex = 0;
		var nextIndex = 1;
		var latestIndex = 2;
		/* Move each head around the board to check all combinations */

		while (headIndex < this._board.length) {
			while (nextIndex < this._board.length) {
				while (latestIndex < this._board.length) {

					let selectedCards = [this._board[headIndex],
					this._board[nextIndex], this._board[latestIndex]];
					var result = CardParsing.setParser(selectedCards);

					if (result) return true;

					latestIndex += 1;
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

	replenishCards() {
		var i = 0;

		while (i < 3) {

			var newCard = this._deck.returnOne();

			this._board.push(newCard);

			i += 1;
		}

		this.addNewCardsToTable();
	}

	addNewCardsToTable() {
		let table = document.getElementById("playing-field");
		let row = table.insertRow(0);

		for (let i = 0; i < 3; i++) {
			let cell = row.insertCell(i);
			cell.setAttribute("id", "cell" + (this._board.length - 3 + i).toString(16));
			cell.innerHTML = '<img src="assets/blank.png" alt="">';
		}
	}

	removeEntry(cards) {

		/* Since we have all unique cards, there is no need to have an if block
		 * to see if this card is in the array.					*/

		var card1 = this._board.indexOf(cards[0]);
		var card2 = this._board.indexOf(cards[1]);
		var card3 = this._board.indexOf(cards[2]);

		let cardIndexes = [card1,card2,card3];

		this._board.splice(card1, 1);
		this._board.splice(card2, 1);
		this._board.splice(card3, 1);

		//Added return of that cards can be added in place of the removed cards
		return cardIndexes;
	}


	cardsLeft() {

		return this._deck.cardsLeft();

	}
}
