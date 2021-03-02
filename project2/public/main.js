
/* main class */
/* Eric Young */

import CardParsing from './CardParser.js';
import DeckMaker from './deck-maker.js';
import BoardMaker from './board.js';
import Card from "./card.js";

var userSet = new Array(0);
var cardBoard = new BoardMaker();


//const table = document.getElementById("playing-field");
const cells = document.getElementsByTagName("td");
const noneButton = document.getElementById("NONE");
const submitButton = document.getElementById("SUBMIT");

const user_PlayAgain = document.getElementById("play-again");
const user_Quit = document.getElementById("quit");


function addToSet(oneCard) {
	/* First check to see if user is unselecting card.
	 * 
	 * Then, if that's not the case, fill a null elment
	 *
	 * with the user's card.
	 **/

	//Location of user card
	var index = userSet.indexOf(oneCard);

	//If in userSet, then remove it
	if (index >= 0) {
		userSet.splice(index, 1);
	}
	else if (userSet.length < 3) {
		//add to selected sets if empty slot available

		userSet.splice(userSet.length + 1, 1, oneCard);


	}

	return (userSet.indexOf(oneCard) > -1);
}

function submitPressed() {
	if (userSet.length == 3) {
		if (CardParsing.setParser(userSet)) {
			cardBoard._score += 1;
			cardBoard.removeEntry(userSet);	/* Remove the SET found by the user. */
			userSet = new Array(0);
			alert("Correct! Plus 1 point!");
			resetSelected();
		} else {
			alert("Your selection is NOT a SET!\n-1 point!");
			cardBoard._score -= 1;
		}
	} else {
		alert("Please Select 3 cards!");
	}
}

function resetSelected() {
	for (let i = 0; i < cardBoard._board.length; i++) {
		let chosen = document.getElementById("cell" + i.toString(16));
		chosen.setAttribute("class", "not_selected");
	}
}

function nonePressed() {
	console.log("none");
	/* If the user claimed to find NO SET, the function userClick assigned null to userSet. */
	if (cardBoard.hasSet()) {
		alert("You missed a SET!");
	} else {
		alert("Replenishing cards.")
		cardBoard.replenishCards();
	}
}

function main() {
	cardBoard.displayBoard();

	for (var i = 0; i < cells.length; i++) {
		cells[i].addEventListener('click', function () {
			let accepted = addToSet(cardBoard._board[parseInt(this.getAttribute("id")[4], 16)]);

			//Change cards opacity to show it has been selected
			if (accepted) {
				this.setAttribute("class", "selected");
			} else {
				this.setAttribute("class", "not_selected");
			}
		});
	}

	noneButton.addEventListener('click', function () {
		nonePressed();
		cardBoard.displayBoard();
	});

	submitButton.addEventListener('click', function () {
		submitPressed();
		cardBoard.displayBoard();
	});

	
	user_PlayAgain.addEventListener('click', function() {

		cardBoard = new BoardMaker();

		main();

	});

	user_Quit.addEventListener('click', function() {

		var end = document.getElementById("end-message");

		var endTable = document.getElementById("playing-field");

		endTable.innerHTML = "";


		end.innerHTML = "Thanks For Playing!";

	});


}

main();
