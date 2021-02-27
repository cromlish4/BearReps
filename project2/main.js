
/* main class */
/* Eric Young */

import './CardParser.js';
import './deck-maker.js';

class Main{
	var userScore = 0;
	var userSet = new Array(3);
	var cardBoard = new CardBoard();	/* TODO: The constructor for card board is named constructor() in the board class. To avoid ambiguity, would it be better that the name be changed to CardBoard()? */
	var deck = new Deck();	/* TODO: The constructor for deck is named constructor() in the deck class. To avoid ambiguity, would it be better that the name be changed to Deck()? */

	/* There will be a score-board class in the HTML with a user-score element. */
	const userScoreDOM = document.getElementById("user-score");
	const scoreBoardDOM = document.querySelector(".score-board");
	
	/* There will be card board represented by a table in the HTML. */
	const table = document.querySelectorAll("td");
	/* TODO: We may also add a picture for the "NONE" button. The user may click this button if failing to find a SET. */
	const none = document.getElementByID("none");

	/* User input no longer needs to be checked beause we are not using string input. */

	/* Store the 3 cards clicked by the user. */
	function userClick(){
		var hasFound = true;

		/* Check if the user claims to find NO SET. */
		none.addEventListener("click", function() {
			hasFound = false;
			userSet = null;
		});

		/* If the user doesn't claim to find NO SET, assign the clicked cards to userSet. */
		if(hasFound) {
			var i;
			for(i = 0; i < 3; i++){
				var j;
				for(j = 0; j < table.length; j++){
					table[j].addEventListener("click", function(event) {
						userSet[i] = Array.from(document.querySelectorAll("td")).findIndex(function(e) { return e === event.target})
					});
				}
			}
		}
	}

	/* Increment or decrement userScore depending on the 3 cards clicked by the user. */
	function handleInput(userSet){
		if(userSet !== null) {	/* If the user found a SET, the value of userSet will not be null. */
			if(setParser(userSet)) {
				userScore += 1;
				userScoreDOM.innerHTML = userScore;
				CardBoard.removeEntry(userSet);	/* Remove the SET found by the user. */
				alert("You got 1 point!");
			} else {
				alert("Your selection is NOT a SET!");
				userScore -= 1;
			}
		} else {	/* If the user claimed to find NO SET, the function userClick assigned null to userSet. */
			if(CardBoard.hasSet()) {
				alert("You missed a SET!");
				userScore -= 1;
			} else {
				alert("Replenish cards.")
				CardBoard.replenishCards();
			}
		}
	}

	function main(){
		while(deck.cardsLeft()) {
			if(userScore >= 0) {
				cardBoard.displayBoard();
				userClick();
				handleInput(userSet);
			} else {
				alert("Game Over.");
				break;
			}
		}

		/* Ask if the user wants to play again and reload accordingly. */
		if(confirm("Do you want to play again?")){
			window.location.reload(true);
		} else {
			alert("Thanks for playing!");
		}
	}
}
