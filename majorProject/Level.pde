class Level { //<>// //<>//

  Square[][] squares;
  color red = color (255, 0, 0);
  color blue = color (0, 0, 255);
  color yellow = color(255, 255, 0);
  color purple = color(255, 0, 255);
  color squareColour;
  color colourToSwitchTo;

  int columns, rows, cellSize;
  Button whiteButton, redButton, blueButton, purpleButton;
  boolean haveWon;

  Level(String fileToLoad) {


    blueButton  = new Button(width*0.95, height*0.3, blue);
    redButton = new Button(width*0.95, height*0.5, red);


    String lines[] = loadStrings(fileToLoad);  

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
  }

  void changeColour() {
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;
    if (squares[x][y].squareColour == red) {
      squareColour = red;
    } else if (squares[x][y].squareColour == blue) {
      squareColour = blue;
    }
    switchColour(squares[x][y], squareColour);
  }


  int switchColour(Square squareToCheckFrom, color squareColour) {
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;

    if ( !inRange(squareToCheckFrom) || ( squareToCheckFrom.squareColour != squareColour)) {
      return 0;
    } else {
      x = squareToCheckFrom.x/cellSize;
      y = squareToCheckFrom.y/cellSize;

      squareToCheckFrom.changeColour();
      int up = switchColour(squares[x][y-1], squareColour);
      int right = switchColour(squares[x+1][y], squareColour);
      int down = switchColour(squares[x][y+1], squareColour);
      int left =  switchColour(squares[x-1][y], squareColour);

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

 void checkForWin() {
    for (int y = 1; y < columns - 1; y++) {
      for (int x = 1; x < rows - 1; x++) {
        if (squares[x][y].squareColour != blue || squares[x][y].squareColour != red) {

          haveWon = false;
        }
      }
    }
    haveWon = true;
  }

  boolean haveWon() {
    checkForWin();
    return haveWon;
  }

  void changeSwitchToColour (char _colourToSwitchTo) {
    if (_colourToSwitchTo == 'b') {
      colourToSwitchTo = blue;
    } else if (_colourToSwitchTo == 'r') {
      colourToSwitchTo = red;
    }
  }
}