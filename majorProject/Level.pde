class Level {  //<>//

  //data
  Square[][] squares;
  JSONObject moves;
  color red, blue, purple, yellow, white;
  color squareColour;
  color colourToSwitchTo, originalsquareColour;
  int movesLeft;
  int columns, rows, cellSize, levelState;
  Button menu;
  Button yellowButton, redButton, blueButton, purpleButton;
  boolean haveWon;

  //construtor
  Level(String fileToLoad, String _moves) {

    red = color (255, 0, 0);
    blue = color (0, 0, 255);
    yellow = color(255, 255, 0);
    purple = color(255, 0, 255);
    white = color(255);
    blueButton  = new Button(width*0.96, height*0.1, blue);
    redButton = new Button(width*0.96, height*0.3, red);
    purpleButton = new Button(width*0.96, height*0.5, purple);
    yellowButton = new Button(width*0.96, height*0.7, yellow);

    menu = new Button( width *.96, height*.95, white);
    moves = loadJSONObject(_moves);
    movesLeft = moves.getInt("moves");

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
    textSize(20);
    text("Moves Left: " + movesLeft, width*.116, height*.975);
    menu.display();
    loadButtons();
  }

  void changeColour() {

    int x = mouseX/cellSize;
    int y = mouseY/cellSize;
    if (squares[x][y].squareColour != colourToSwitchTo) { // only do this if the colour of the square is not the same as the colour that it needs to switch to
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
      if (checkForWin()) {
        levelState = 2;
        println("levelState: " + levelState);
      } else {
        levelState = 0;
      }
      return up + right + down + left + 1;
    }
  }

  boolean inRange(Square squareToCheck) {
    return ((squareToCheck.x/cellSize > 0 && squareToCheck.x/cellSize < rows-1) && (squareToCheck.y/cellSize > 0 && squareToCheck.y/cellSize < columns-1));
  }

  void loadButtons() {
    blueButton.display();
    redButton.display();
    purpleButton.display();
    yellowButton.display();
  }

  boolean checkForWin() {
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
    } else if (levelState == 1) { // win screen/moving to the next level 
      display();
    } else if (levelState == 2) { // win screen/moving to the next level 
      println("you won");
      display();
    } else if (levelState == 3) { // win screen/moving to the next level 
      println("you lost");
      display();
    }
  }
  void changeSwitchToColour() {
    if (blueButton.isMouseHovering()) {
      colourToSwitchTo = blue;
    } else if (redButton.isMouseHovering()) {
      colourToSwitchTo = red;
    } else if (purpleButton.isMouseHovering()) {
      colourToSwitchTo = purple;
    } else if (yellowButton.isMouseHovering()) {
      colourToSwitchTo = yellow;
    }
    levelState = 1;
  }
}