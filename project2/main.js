
/* main class */
/* Eric Young */


import './CardParser.js';
import * as Deck from './deck-maker.js';
import * as Board from './board.js';

class Main{
	var userScore = 0;
	var userSet = new Array(3);
	var cardBoard = new Board();	/* TODO: The constructor for card board is named New() in the board class. To avoid ambiguity, would it be better that the name be changed to CardBoard()? */
	var deck = new Deck();	/* TODO: The constructor for deck is named Initialize() in the deck class. To avoid ambiguity, would it be better that the name be changed to Deck()? */

	/* There will be a score-board class in the HTML with a user-score element. */
	const userScoreDOM = document.getElementById("user-score");
	const scoreBoardDOM = document.querySelector(".score-board");
	
	/* There will be a card-board class in the HTML with 12 elements for the cards displayed on the card board. Each element is represented by a cell in the HTML table. */
	const card0 = document.getElementById("cell0");
	const card1 = document.getElementById("cell1");
	const card2 = document.getElementById("cell2");
	const card3 = document.getElementById("cell3");
	const card4 = document.getElementById("cell4");
	const card5 = document.getElementById("cell5");
	const card6 = document.getElementById("cell6");
	const card7 = document.getElementById("cell7");
	const card8 = document.getElementById("cell8");
	const card9 = document.getElementById("cell9");
	const card10 = document.getElementById("cell10");
	const card11 = document.getElementById("cell11");
	const cards = {card0, card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11};
	const none = document.getElementByID("none");	/* TODO: We may also add a picture for the "NONE" button. The user may click this button if failing to find a SET. */
	/* TODO: We may also need blank pictures for card12, card13, card14 or even more cards to handle the situation where there is no SET among all the 12 cards on the board. */
	const cardBoardDOM = document.querySelector(".card-board");

	/* User input no longer needs to be checked beause we are not using string input. */

	/* Store the 3 cards clicked by the user.
	 * TODO: Not sure if the second click assigns to userSet[0] or userSet[1].
	 * */
	function userClick(){
		var hasFound = true;

		/* Check if the user claims to find NO SET. */
		none.addEventListener("click", function() {
			hasFound = false;
			userSet = null;
		});

		/* If the user doesn't claim to find NO SET, continue. */
		if(hasFound) {
			var i;
			for(i = 0; i < 3; i++){
				var j;
				for(j = 0; j < 12; j++){
					cards[j].onclick = function() {userSet[i] = cardBoard.board[j]};
				}
			}
		}
	}

	/* Increment or decrement userScore depending on the 3 cards clicked by the user. */
	function handleInput(userSet){
		if(userSet !== null) {
			if(setParser(userSet)) {
				userScore += 1;
				userScoreDOM.innerHTML = userScore;
				CardBoard.removeEntry(userSet);	/* Remove the cards that form a SET. */
			} else {
				alert("Your selection is NOT a SET!");
				userScore -= 1;
			}
		} else {
			if(CardBoard.hasSet()) {
				alert("You missed a SET!");
				userScore -= 1;
			} else {
				alert("Replenish cards.")
				CardBoard.replenishCards();	/* TODO: See comments above for extra card pictures. */
			}
		}
	}

	function main(){
		/* TODO: Need a loop for restarting the game. */
		while(deck.cardsLeft()) {
			if(userScore >= 0) {
				CardBoard.displayBoard();
				userClick();
				handleInput(userSet);
			} else {
				alert("Game Over.");
				break;
			}
		}
	}
}
