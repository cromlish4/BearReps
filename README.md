Set in JavaScript
--------

"Set" is a card game in which players attempt to find a group of cards that satisfy a particular criterion. 
It is a speed game: 12 cards are dealt face-up, and the players try to be the first to make a set from the visible cards. 
For a complete description of the game see the Wikipedia entry: https://en.wikipedia.org/wiki/Set_(card_game). 
This project creates a functional game of set using Javascript, CSS, HTML. Node.js is used to run the game locally. 

Motivation
----------

This project was intended to combine what we have learned about Javascript, CSS, and HTML by taking the our previous Ruby Set and making it in Javascript using CSS and HTML.

Since we had already created the game before in Ruby the focus was on the Javascript, CSS, and HTML instead of the logic of the game.

Features
--------

This project was implemented using multiple classes for the major functions for the game. 
The Classes were the Cards, the Deck maker, the Set parser, and Board maker. 
This version has a GUI that allows the user to visually select cards to make a set. The new GUI
also has the score and the rules displayed at all times, allowing a user to refer back during gameplay. 

TODO: I will add the rest of the features once implemented, so that I can see them in action.

Screenshots
-----------
![image](https://user-images.githubusercontent.com/77806397/107402331-d50c6300-6ad1-11eb-9b2a-c8847d7e8d50.png) TODO: Replace once game is done 




Installation
------------

After cloning our project and navigating to the project2 folder, with a computer with Node.js installed the command "node server.js" in the terminal. 
If it was succesful it will output "Server is listening on port 8000". Then by going to 
"http://localhost:8000" you can load the game.

Tests
-----

We determined 6 important tests for our code, which all were handled as desired:
TODO: Check what test are in this new version.
1) Incorrect input:
  
    Say a user enters a random string, our project will warn the player about an incorrect entry, and allow for a redo.
    
2) False Set:

    Say a player determined some cards were a set. If he/she was wrong, our game tells the player the set was wrong, and docks a point.
    
3) Correct Set:

    Say a player finally finds a valid set. When the user inputs a true set, our game congratulates the player and awards 1 point. Then
    the board is replenished as desired. 
    
4) No sets left: false

    Say a player believes there are no more sets on the board. If the player missed a set, our game informs the player and gives him/her 
    another chance WITHOUT docking a point.
    
5) No sets left: true

    Say a player believes there are no more sets on the board. If so, the game adds 3 cards to the board, and play continues.
    
6) Exit

    Say at any point, a player wants to end the game. If he/she enters "exit" the program exits everytime.


Acknowledgement
---------------
Thanks to Ryan O'Donovan for being project lead for this project. He helped to coordinate the project by creating the meetings and the plans for who would work on which aspect of the project. 
He also created the Node.js server for running the game locally, converted the Board Class from ruby to javascript, and Helped with HTML formatting. 
Also for helping out in many parts of the project that people needed help with.

Andrew Conners converted the deckmaker class and helped to work on the HTML and refining the css.
He also generated seperate images for each card by cropping a larger sheet with every card on it as well as adding event listeners to the main class.

Zhuo Chen converted the card class that is the framework of the game since the card is the basis of the game.

Eric Young worked on the main class which handles pulling everything together and is the core of the project. 

Michael Cromlish converted the card parsing class that handles checking the cards and seeing if they are a set or not and did some light css formatting.

Samiul Islam helped out in many parts of the project with a focus on the HTML and the helping out on the main and card classes. 

Credit
------

README guidelines:
makeareadme.com and "A Beginners Guide to writing a Kickass READMe" by Akash Nimare

Ryan O'Donovan, for creating the original readme which this one is based on.

The orginal image sheet that the indivual card images were cropped from. [Image](Link)


