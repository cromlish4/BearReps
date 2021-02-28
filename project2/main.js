
/* main class */
/* Eric Young */

import * as Parser from './CardParser.js';
import * as Deck from './deck-maker.js';
import * as Board from './board.js';


var userScore = 0;
var userSet = new Array(0);
var parsedSet = new Array(0);
var cardBoard = new BoardMaker();
var deck = new DeckMaker();

/* There will be a score-board class in the HTML with a user-score element. */
const userScoreDOM = document.getElementById("user-score");
const scoreBoardDOM = document.querySelector(".score-board");

/* There will be card board represented by a table in the HTML. */
var table = document.querySelectorAll("td");
/* TODO: We may also add a picture for the "NONE" button. The user may click this button if failing to find a SET. */
const none = document.getElementByID("none");

/* User input no longer needs to be checked beause we are not using string input. */

/* Store the 3 cards clicked by the user. */
function userClick() {
	var hasFound = true;

	/* Check if the user claims to find NO SET. */
	none.addEventListener("click", function () {
		hasFound = false;
		userSet = null;
	});

	/* If the user doesn't claim to find NO SET, assign the clicked cards to userSet. */
	if (hasFound) {
		for (var i = 0; i < table.length; i++) {
			table[i].addEventListener("click", function (event) {
				/* j is the index of the clicked card in the table array. */
				var j = Array.from(document.querySelectorAll("td")).findIndex(function (e) { return e === event.target });

				/* Get the string of the clicked card and store it in the userSet array. */
				if (userSet.length < 3) {
					userSet.push(table[j].innerTEXT);
				} else {
					/* TODO: This is to solve the problem that the length of the userSet array grows larger than 3 because addEvenetListener works all the time. */
					/* TODO: However, error occurs if the user accidentally clicks on a card. Need solution for this. */
					userSet.length = 0;
					userSet.push(table[j].innerTEXT);
				}
			});
		}
	}
}

/* Increment or decrement userScore depending on the 3 cards clicked by the user. */
function handleInput(userSet) {
	if (userSet !== null) {	/* If the user found a SET, the value of userSet will not be null. */
		/* Convert the card strings to card objects. */
		card1 = [userSet[0].slice(0, 1), userSet[0].slice(1, 2), userSet[0].slice(2, 3), userSet[0].slice(3, 4)];
		card2 = [userSet[1].slice(0, 1), userSet[1].slice(1, 2), userSet[1].slice(2, 3), userSet[1].slice(3, 4)];
		card3 = [userSet[2].slice(0, 1), userSet[2].slice(1, 2), userSet[2].slice(2, 3), userSet[2].slice(3, 4)];
		parsedSet = [card1, card2, card3];

		if (setParser(parsedSet)) {
			userScore += 1;
			userScoreDOM.innerHTML = userScore;
			CardBoard.removeEntry(parsedSet);	/* Remove the SET found by the user. */
			alert("You got 1 point!");
		} else {
			alert("Your selection is NOT a SET!");
			userScore -= 1;
		}

	} else {	/* If the user claimed to find NO SET, the function userClick assigned null to userSet. */
		if (CardBoard.hasSet()) {
			alert("You missed a SET!");
			userScore -= 1;
		} else {
			alert("Replenish cards.")
			CardBoard.replenishCards();
		}
	}
}

function main() {
	while (deck.cardsLeft()) {
		if (userScore >= 0) {
			cardBoard.displayBoard();
			userClick();
			handleInput(userSet);
		} else {
			alert("Game Over.");
			break;
		}
	}

	/* Ask if the user wants to play again and reload accordingly. */
	if (confirm("Do you want to play again?")) {
		window.location.reload(true);
	} else {
		alert("Thanks for playing!");
	}
}
