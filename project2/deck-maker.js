//Author: Andrew Connors
//Note: May have to edit this
import * as Card from './Card.js';
class DeckMaker {

  var numbers = Card.getNumbers();
  var colors = Card.getColors();
  var shapes = Card.getShapes();
  var shading = Card.getShadingTypes();

  //Initialize the deck array with 81 unique cards.
  fucntion Initialize(){
    this.deck = new Array(81);
    var w = 0;
    var x = 0;
    var y = 0;
    var z = 0;
    var count = 0;
    while(w < 3){
      x = 0;
      while(x < 3){
        y = 0;
        while(y < 3){
          z = 0;
          while(z < 3){
            var nextCard = new Card(numbers[w], colors[x], shading[y], shapes[z]);
            z += 1;
            this.deck[count] = nextCard;
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
  function cardsLeft(){
    return this.deck.length;
  }

  //TODO: Insert checkCard function here
  funtion checkCard(numbers, color, shapes, shading){
    var = 0 ;
    var y = 0;
    while(x < 81 && this.deck[x] != null) {
      if(this.deck[x].color == color && this.deck[x].number == numbers && this.deck[x].shape == shapes && this.deck[x].shading == shading){

        return true;
      }
    }
    //This line should only execute if no instance of the given card was found.
    return false;
  }

  //TODO: Insert shuffle function here
  function shuffleDeck(){
    var x = 0;
    var num;
    var replace = Array.new(81);
    while(x < 81){
      //Generate a random index 0-80
      num = Math.floor(Math.random() * 81);
      //Check to see if index already has card in it in the new deck
      while(replace[num] != null){
        //If so, generate a new random index. Repeat until clean index
        num = Math.floor(Math.random() * 81);
      }
      //Make the random index have the next card in the original deck
      replace[num] = this.deck[x];
      x+=1;
    }
    //Make the actual deck equal to the new, shuffled deck.
    this.deck = replace;
  }

  function returnOne(){
    return this.deck.shift();
  }

}
