class Level {  //<>//

  //data
  Square[][] squares;  
  color colour1, colour2, colour3, colour4, white, black;
  color squareColour;
  color colourToSwitchTo, originalsquareColour;
  int movesLeft;
  int columns, rows, cellSize, levelState;
  Button menu;

  boolean haveWon;

  //constructor
  Level(String fileToLoad, int _movesLeft) {
    colour1 = color (80, 90, 126);
    colour2 = color (89, 237, 166);
    colour4 = color(69, 120, 227);
    colour3 = color(255, 121, 184);
    white = color(255);
    black = color(0);

    menu = new Button( width *.96, height*.97, width/13, height/17,"MENU",white);

    movesLeft = _movesLeft;
    levelState = 0;
    String lines[] = loadStrings(fileToLoad);  
    haveWon = false;
    columns = lines.length;
    rows = lines[0].length();

  //  println ("rows: " + rows, "columns: " + columns);

    cellSize = int(width/rows);

    squares= new Square[rows][columns];

    for (int y = 0; y <columns; y++) {
      for (int x = 0; x < rows; x++) {
        char squareColor = lines[y].charAt(x);
        squares[x][y] = new Square(x*cellSize, y*cellSize, cellSize, squareColor); //creating the 2D array grid
      }
    }
  }
  //behaviour
  void display() {

    for (int y = 0; y < columns; y++) {
      for (int x = 0; x < rows; x++) {
        squares[x][y].display();
      }
    }

    textAlign(CENTER, CENTER);
    fill(255);
    rect(width*.5, height*.97, cellSize*8, cellSize, 20);
    fill(0);
    textSize(25);
    text("MOVES LEFT: " + movesLeft, width*.5, height*.97);
    menu.display();
    displayKeyCode();
  }

  void changeColour() {

    int x = mouseX/cellSize;
    int y = mouseY/cellSize;
// only do this if the colour of the square is not the same as the colour that it needs to switch to and if a key has been pressed
    if (squares[x][y].squareColour != colourToSwitchTo && (colourToSwitchTo != 0)) { 
      movesLeft--;
      switchColour(squares[x][y], squares[x][y].squareColour);
    }
  }

  int switchColour(Square squareToCheckFrom, color _originalsquareColour) {
    originalsquareColour = _originalsquareColour;
    int x = squareToCheckFrom.x/cellSize;
    int y = squareToCheckFrom.y/cellSize;

    if ( !inRange(squareToCheckFrom) || ( squareToCheckFrom.squareColour != originalsquareColour)) { //base case

      return 0;
    } else {
       //change the colour of specific square
      squareToCheckFrom.changeColour(colourToSwitchTo);
      //doing recursion on the adjecent squares of a specific square
      int up = switchColour(squares[x][y-1], originalsquareColour); 
      int right = switchColour(squares[x+1][y], originalsquareColour);
      int down = switchColour(squares[x][y+1], originalsquareColour);
      int left =  switchColour(squares[x-1][y], originalsquareColour);
      checkForWin(); 

      return up + right + down + left + 1;
    }
  }

  boolean inRange(Square squareToCheck) {
    return ((squareToCheck.x/cellSize > 0 && squareToCheck.x/cellSize < rows-1) && (squareToCheck.y/cellSize > 0 && squareToCheck.y/cellSize < columns-1));
  }


  boolean haveWon() {
    for (int y = 1; y < columns - 1; y++) { 
      for (int x = 1; x < rows - 1; x++) {
        if (squares[x][y].squareColour != colourToSwitchTo) { //if the squareColour is not the same as the last colourToSwitchTo the game haas not been won
          return false;
        }
      }
    }
    return true;
  }


  void goToCorrectPlace() {
    if (levelState == 0) { //playing game 
      background(0);
      display();
    } else if (levelState == 1) { // win screen
      displayWinScreen();
    } else if (levelState == 2) {//out of moves
      displayLoseScreen();
    }
  }

  void changeSwitchToColour(char number) { //takes the key pressed and changes colorToSwitchTo to the corresponding colour
    if (number == '1') {
      colourToSwitchTo = colour1;
    } else if (number == '2') {
      colourToSwitchTo = colour2;
    } else if (number == '3') {
      colourToSwitchTo = colour3;
    } else if (number == '4') {
      colourToSwitchTo = colour4;
    }
  }
  void checkForWin() {
    if (movesLeft == 0) { //only do this if all moves have been taken and then go to the correct state (win or lose)
      if (haveWon()) {
        levelState = 1;
      } else {
        levelState = 2;
      }
    } else if (movesLeft > 0) { // if there are moves still left continue with the game
      levelState = 0;
    }
  }
  void displayKeyCode() { //displaying the colours and the corresponding number
    textSize(25);

    textAlign(CENTER, CENTER);

    fill(colour1);
    rect(width*0.96, height*.425, cellSize, cellSize, 20);
    fill(colour2);
    rect(width*.96, height*.475, cellSize, cellSize, 20);    
    fill(colour3);
    rect(width*.96, height*.525, cellSize, cellSize, 20);
    fill(colour4);
    rect(width*.96, height*.575, cellSize, cellSize, 20);

    fill(255);
    text("1", width*.96, height*.425);
    text("2", width*.96, height*.475);
    text("3", width*.96, height*.525);
    text("4", width*.96, height*.575);
  }
  void displayWinScreen() {
    display();
    fill(255);
    rect(width/2, height/2, width, 100, 10);
    fill(colour1);
    textSize(50);
    text("NICE JOB!", width/2, height/2);
  }
  void displayLoseScreen() { 
    display();
    fill(255);
    rect(width/2, height/2, width, 100, 10);
    fill(colour2);
    textSize(40);
    text("OUT OF MOVES! TRY AGAIN!", width/2, height/2);
  }
}