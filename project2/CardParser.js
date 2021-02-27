/*Class Containing 2 methods to check cards and one to convert
Author: Michael Cromlish
Method 1 checks if 3 cards are part of a set.
Method 2 checks if a card is in a deck.*/

//Import Card Class
import * as Card from './Card.js';
export default class CardParsing {
    /* Method 1
    setParser takes in 3 cards and checks if it is a set or not
    returns false if cards are not in a set, true if in set.
    cards is an Array of exactly 3 cards */
    setParser(cards){
        // Output value of shape
        var outputValueShape = false;
        // Output value of color
        var outputValueColor = false;
        // Output value of number
        var outputValueNumber = false;
        // Output value of shade
        var outputValueShade = false;
        // Separating the 3 cards being checked.
        var card1 = cards[0];
        var card2 = cards[1];
        var card3 = cards[2];

        // Check for amount of shape
        if(card1.shape() == card2.shape() && card1.shape() == card3.shape()) {
            outputValueShape = true;
        }else if(card1.shape() != card2.shape() && card1.shape() != card3.shape() &&
            card2.shape() != card3().shape) {
            outputValueShape = true;
        }
        //Otherwise false by default

        //Check for Color
        if(card1.color() == card2.color() && card1.color() == card3.color()) {
                outputValueColor=true;
        }else if(card1.color() != card2.color() && card1.color() != card3.color() &&
             card2.color() != card3.color()) {
            outputValueColor=true;
        }
        //Otherwise false by default

        //Check for amount of Number
        if(card1.number() == card2.number() && card1.number() == card3.number()) {
            outputValueNumber = true;
        }else if(card1.number() != card2.number() && card1.number() != card3.number() &&
            card2.number() != card3.number()) {
            outputValueNumber = true
        }
        //Otherwise false by default

        //Check for Shade
        if(card1.shading() == card2.shading() && card1.shading() == card3.shading()) {
            outputValueShade = true;
        }else if(card1.shading() != card2.shading() && card1.shading() != card3.shading() &&
            card2.shading() != card3.shading()) {
            outputValueShade=true;
        }
        //Otherwise false by default

        //Compares the results of each check and if all pass then the cards are a set, else not a set
        var overallOutput = false;
        if(outputValueShape && outputValueColor && outputValueNumber && outputValueShade) {
            overallOutput = true;
        }
        return overallOutput;
    }
    /* Method 2
    boardCheck takes in a card input and the board to check if the card exists on the board.
    card - single card object
    board - any size array of card objects
    returns True if the card is on the board. */
    boardCheck(card, board) {
        var cardFound = false;
        // Goes though entire deck and makes cardFound true if card is found
        for(let cardTest of board){
            if (card.shape() == cardTest.shape() && card.color() == cardTest.color() &&
                card.shading() == cardTest.shading() && card.number() == cardTest.number()){
                cardFound=true;
            }
        }
        return cardFound;
    }
    /* Author : Samiul Islam then converted into JS by Michael Cromlish
    Take an input representing 1 card as a string (1R<0>) then look through
    the board for cards with the same feature and return the card object on the board
    Make sure to call boardCheck first */
    convertStringToCardOnBoard(input, board) {
        for(let boardCard of board){
            if (boardCard.return_card() == input.return_card()){
                return boardCard;
            }
        }
    }
}

