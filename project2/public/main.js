
/* main class */
/* Eric Young */

import Parser from './CardParser.js';
import Deck from './deck-maker.js';
import Board from './board.js';
import Card from "./card.js";

var userScore = 0;
var userSet = new Array(0);
var parsedSet = new Array(0);
var cardBoard = new Board();
var deck = new Deck();


const table = document.getElementById("playing-field");

        const cells = table.getElementsByTagName("td");


 for(var i = 0; i < cells.length; i++) {

                cells[i].addEventListener('click', function() {


                        console.log("Hey This is cool");

                });

        }


/* There will be a score-board class in the HTML with a user-score element. */
const userScoreDOM = document.getElementById("user-score");
const scoreBoardDOM = document.querySelector(".score-board");

/* There will be card board represented by a table in the HTML. */
var table = document.querySelectorAll("td");
/* TODO: We may also add a picture for the "NONE" button. The user may click this button if failing to find a SET. */
//const none = document.getElementByID("none");

/* User input no longer needs to be checked beause we are not using string input. */

/* Store the 3 cards clicked by the user. */


function userClick() {
	var hasFound = true;

	/* There will be a score-board class in the HTML with a user-score element. */
	const userScoreDOM = document.getElementById("user-score");
	const scoreBoardDOM = document.querySelector(".score-board");

	
	


	/* There will be a card-board class in the HTML with 12 elements for the cards displayed on the card board. Each element is represented by a cell in the HTML table. 
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


	function addToSet(oneCard){
		for(x = 0; x < 3; x++){
			if(userSet[x] == null){
				userSet[x] = oneCard;
				break;
			}
		}
	}
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

		/*Add event listeners to all the cells*/
		card0.addEventListener("click", function() {
			addToSet(card0);
		})
		card1.addEventListener("click", function() {
			addToSet(card1);
		})
		card2.addEventListener("click", function() {
			addToSet(card2);
		})
		card3.addEventListener("click", function() {
			addToSet(card3);
		})
		card4.addEventListener("click", function() {
			addToSet(card4);
		})
		card5.addEventListener("click", function() {
			addToSet(card5);
		})
		card6.addEventListener("click", function() {
			addToSet(card6);
		})
		card7.addEventListener("click", function() {
			addToSet(card7);
		})
		card8.addEventListener("click", function() {
			addToSet(card8);
		})
		card9.addEventListener("click", function() {
			addToSet(card9);
		})
		card10.addEventListener("click", function() {
			addToSet(card10);
		})
		card11.addEventListener("click", function() {
			addToSet(card11);
		})

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

	function main(){
		/* TODO: Need a loop for restarting the game. */
		while(deck.cardsLeft()) {
			cardsLeft.innerHTML = deck.cardsLeft();
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
