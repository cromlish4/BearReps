
/* main class */
/* Samiul Islam */

import CardParsing from './CardParser.js';
import DeckMaker from './deck-maker.js';
import BoardMaker from './board.js';
import Card from "./card.js";

var userSet = new Array(0);
var cardBoard = new BoardMaker();

const cardsInDeck = document.getElementById("cards-left");
const table = document.getElementById("playing-field");
const cells = document.getElementsByTagName("td");
const noneButton = document.getElementById("NONE");
const submitButton = document.getElementById("SUBMIT");
const highlightButton = document.getElementById("HIGHLIGHT");

const user_PlayAgain = document.getElementById("play-again");
const user_Quit = document.getElementById("quit");


function addToSet(oneCard) {
	/* First check to see if user is unselecting card.
	 * 
	 * Then, if that's not the case, fill a null element
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
			let cardPos = Array[3];
			cardPos = cardBoard.removeEntry(userSet);	/* Remove the SET found by the user. */
			userSet = new Array(0);
			cardsInDeck.innerHTML = cardBoard.cardsLeft();
			alert("Correct! Plus 1 point!");
			//Add new cards where old ones were.
			let i =0;
			cardPos.sort(numSort);
			while(i<3) {
				let newCard = cardBoard._deck.returnOne();
				//cardBoard._board[cardPos[i]] = newCard;
				cardBoard._board.splice(cardPos[i],0,newCard);
				i++;
			}
			cardBoard.displayBoard();
			resetSelected();
		} else {
			alert("Your selection is NOT a SET!\n-1 point!");
			cardBoard._score -= 1;
			cardBoard.displayBoard();
			resetSelected();
		}
	} else {
		alert("Please Select 3 cards!");
	}
}

function numSort(a,b){
	return a - b;
}

function resetSelected() {
	for (let i = 0; i < cardBoard._board.length; i++) {
		let chosen = document.getElementById("cell" + i.toString(16));
		chosen.setAttribute("class", "not_selected");
	}
}
//Finds a set in the board
async function highlightSelected() {
	if(cardBoard.hasSet()) {
		let cardLocs = cardBoard.setLocation();
		//Highlights the cardSet
		for(var i=0;i<3;i++) {
			cells[cardLocs[i]].setAttribute("class", "selected");

			//Taken from https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
			await new Promise(r => setTimeout(r, 1000));
			cells[cardLocs[i]].setAttribute("class", "not_selected");
		}
	}else{
		//Alert for No set
		alert("No Set Found.");
	}
}

function nonePressed() {
	console.log("none");
	/* If the user claimed to find NO SET, the function userClick assigned null to userSet. */
	if (cardBoard.hasSet()) {
		alert("You missed a SET!");

		userSet = new Array(0);

	} else {
		alert("Replenishing cards.");

		userSet = new Array(0);

		cardBoard.replenishCards();
		refreshToggle();

	}
}
/*Reloads all buttons to toggleable.*/
function refreshToggle(){
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
}

function main() {
	cardBoard.displayBoard();
	//Making this value will enable Debug Mode for quick sets.
	//Also line 36 in index.html must be uncommented.
	let debug_mode = true;
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
	if(debug_mode) {
		highlightButton.addEventListener('click', function () {
			highlightSelected();
			cardBoard.displayBoard();
		});
	}

	//Ryan O'Donovan//

	
	user_PlayAgain.addEventListener('click', function() {

		cardBoard = new BoardMaker();

		userSet = new Array(0);

		for (var i = 0; i < cells.length; i++) {
                
			cells[i].setAttribute("class", "not_selected");

		}

		cardBoard.displayBoard();

		cardBoard._score = 0;


	});
		

	user_Quit.addEventListener('click', function() {

		var end = document.getElementById("end-message");

		table.remove();

		var rules = document.getElementById("rules-field");

		rules.remove();

		
		submitButton.remove();
		noneButton.remove();
		if (debug_mode){
			highlightButton.remove();
		}
		user_PlayAgain.remove();
		user_Quit.remove();


		var endDeckTable = document.getElementById("deck-label");

		endDeckTable.remove();


		var endDeck = document.getElementById("deck");

		endDeck.remove();

		end.innerHTML = "Thanks For Playing!";

	});


}

main();
