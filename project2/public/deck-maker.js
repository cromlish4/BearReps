//Author: Andrew Connors
import Card from './card.js';

export default class DeckMaker {

  //Initialize the deck array with 81 unique cards.
  constructor() {
    this._deck = new Array(81);

    var w = 0;
    var x = 0;
    var y = 0;
    var z = 0;

    var count = 0;

    while (w < 3) {
      x = 0;
      while (x < 3) {
        y = 0;
        while (y < 3) {
          z = 0;
          while (z < 3) {
            var nextCard = new Card(Card.getNumbers()[w], Card.getColors()[x], Card.getShadingTypes()[y], Card.getShapes()[z]);
            z += 1;
            this._deck[count] = nextCard;
            count += 1;
          }
          y += 1;
        }
        x += 1;
      }
      w += 1;
    }
  }

  //Return the number of cards left in the deck.
   cardsLeft() {
    return this._deck.length;
  }

  //TODO: Insert shuffle function here
  shuffleDeck() {
    var x = 0;
    var num;
    var replace = new Array(81);
    while (x < 81) {
      //Generate a random index 0-80
      num = Math.floor(Math.random() * 81);
      //Check to see if index already has card in it in the new deck
      while (replace[num] != null) {
        //If so, generate a new random index. Repeat until clean index
        num = Math.floor(Math.random() * 81);
      }
      //Make the random index have the next card in the original deck
      replace[num] = this._deck[x];
      x += 1;
    }
    //Make the actual deck equal to the new, shuffled deck.
    this._deck = replace;
  }

  returnOne() {
    return this._deck.shift();
  }
}
