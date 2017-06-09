class Level { //<>// //<>//

  Square[][] squares;
  color red = color (255, 0, 0);
  color blue = color (0, 0, 255);
  color yellow = color(255, 255, 0);
  color purple = color(255, 0, 255);
  color squareColour;
  color colourToSwitchTo, originalsquareColour;

  int columns, rows, cellSize, state;
  Button whiteButton, redButton, blueButton, purpleButton;
  boolean haveWon;

  Level(String fileToLoad) {


    blueButton  = new Button(width*0.95, height*0.3, blue);
    redButton = new Button(width*0.95, height*0.5, red);

    state = 0;
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
  void display() {

    for (int y = 0; y < columns; y++) {
      for (int x = 0; x < rows; x++) {
        squares[x][y].display();
      }
    }
    //loadButtons();
  }

  void changeColour() {
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;

    switchColour(squares[x][y], squares[x][y].squareColour);

    //put check win fucntion here
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
        state = 1;
        println("state: " + state);
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
  }

  boolean checkForWin() {
    for (int y = 1; y < columns - 1; y++) {
      for (int x = 1; x < rows - 1; x++) {
        if (squares[x][y].squareColour != colourToSwitchTo) {
          println("got here - false");
          return false;
        }
      }
    }
    println("got here - true");
    return true;
  }

  void changeSwitchToColour (char letter) {
    if (letter == 'b') {
      colourToSwitchTo = blue;
    } else if (letter == 'r') {
      colourToSwitchTo = red;
    } else if (letter == 'r') {
      colourToSwitchTo = red;
    } else if (letter == 'p') {
      colourToSwitchTo = purple;
    } else if (letter == 'y') {
      colourToSwitchTo = yellow;
    }
  }
}