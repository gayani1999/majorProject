class Level {  //<>//

  //data
  Square[][] squares;  //JSONObject moves;
  color colour1, colour2, colour3, colour4, white;
  color squareColour;
  color colourToSwitchTo, originalsquareColour;
  int movesLeft;
  int columns, rows, cellSize, levelState;
  Button menu;
  // Button colour4Button, colour1Button, colour2Button, colour3Button;
  boolean haveWon;

  //construtor
  Level(String fileToLoad, int _movesLeft) {
    colour1 = color (80, 90, 126);
    colour2 = color (89, 237, 166);
    colour4 = color(69, 120, 227);
    colour3 = color(255, 121, 184);
    white = color(255);
    //colour2Button  = new Button(width*0.96, height*0.1, colour2);
    //colour1Button = new Button(width*0.96, height*0.3, colour1);
    //colour3Button = new Button(width*0.96, height*0.5, colour3);
    //colour4Button = new Button(width*0.96, height*0.7, colour4);

    menu = new Button( width *.96, height*.97, white);

    movesLeft = _movesLeft;
    levelState = 0;
    String lines[] = loadStrings(fileToLoad);  
    haveWon = false;
    columns = lines.length;
    rows = lines[0].length();

    println ("rows: " + rows, "columns: " + columns);

    cellSize = int(width/rows);

    squares= new Square[rows][columns];

    for (int y = 0; y <columns; y++) {
      for (int x = 0; x < rows; x++) {
        char squareColor = lines[y].charAt(x);
        squares[x][y] = new Square(x*cellSize, y*cellSize, cellSize, squareColor);
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
    if (squares[x][y].squareColour != colourToSwitchTo) { // only do this if the colour of the square is not the same as the colour that it needs to switch to
      movesLeft--;
      switchColour(squares[x][y], squares[x][y].squareColour);
    }
  }

  int switchColour(Square squareToCheckFrom, color _originalsquareColour) {
    originalsquareColour = _originalsquareColour;
    int x = squareToCheckFrom.x/cellSize;
    int y = squareToCheckFrom.y/cellSize;

    if ( !inRange(squareToCheckFrom) || ( squareToCheckFrom.squareColour != originalsquareColour)) {

      return 0;
    } else {
      squareToCheckFrom.changeColour(colourToSwitchTo);
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

  //void loadButtons() {
  //  colour2Button.display();
  //  colour1Button.display();
  //  colour3Button.display();
  //  colour4Button.display();
  //}

  boolean haveWon() {
    for (int y = 1; y < columns - 1; y++) {
      for (int x = 1; x < rows - 1; x++) {
        if (squares[x][y].squareColour != colourToSwitchTo) {
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
      background(0);
      display();
      fill(255);
      rect(width/2, height/2, width, 100, 10);
    } else if (levelState == 2) {//out of moves
      println("you lost, out of moves");
      display();
      fill(0);
      rect(width/2, height/2, width, 100, 10);
    }
  }

  void changeSwitchToColour(char number) {
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
    if (movesLeft == 0) {
      if (haveWon()) {
        levelState = 1;
      } else {
        levelState = 2;
      }
    } else if (movesLeft > 0) {
      levelState = 0;
    }
  }
  void displayKeyCode() {
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
}