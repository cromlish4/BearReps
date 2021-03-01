
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
// Author: Ryan O'Donovan //

var user_selection = new Array(3);

const table = document.getElementById("playing-field");

        const cells = table.getElementsByTagName("td");


 for(var i = 0; i < cells.length; i++) {

                cells[i].addEventListener('click', function() {


		console.log("You clicked on me"); }

		);

                }

        
/*
while(deck.cardsLeft()) {
                        cardsLeft.innerHTML = deck.cardsLeft();
                        if(userScore >= 0) {
                                CardBoard.displayBoard();
                                handleInput(userSet);
                        } else {
                                alert("Game Over.");
                                break;
                        }
                }

*/

/* There will be a score-board class in the HTML with a user-score element. */
const userScoreDOM = document.getElementById("user-score");
const scoreBoardDOM = document.querySelector(".score-board");

/* There will be card board represented by a table in the HTML. */
var table__ = document.querySelectorAll("td");
/* TODO: We may also add a picture for the "NONE" button. The user may click this button if failing to find a SET. */
//const none = document.getElementByID("none");

/* User input no longer needs to be checked beause we are not using string input. */

/* Store the 3 cards clicked by the user. */


function userClick(user_selection, index) {
		
	var indexOf = 0;

	var check = false;

	indexOf = user_selection.indexOf(cardBoard._board[index]);

	if(indexOf === -1) {

		user_selection.push(cardBoard._board[index]);
	}else{

		user_selection.splice(indexOf, 1);

	}

	if (user_selection.length === 3) {

		check = setParser(user_selection);

		if (check === true) {

			userScore += 1;

			cardBoard._board.removeEntry(user_selection);

			console.log("Good");

		}else {

			userScore -= 1;

			console.log("Bad");
		}



	}



}


	/* There will be a card-board class in the HTML with 12 elements for the cards displayed on the card board. Each element is represented by a cell in the HTML table. */
	const none = document.getElementById("none");	/* TODO: We may also add a picture for the "NONE" button. The user may click this button if failing to find a SET. */
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
	function userClik(){
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
	}
