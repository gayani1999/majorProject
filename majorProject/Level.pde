class Level { //<>// //<>//

  Square[][] squares;
  color red = color (255, 0, 0);
  color blue = color (0, 0, 255);
  int columns, rows, cellSize;


  Level(String fileToLoad) {

    String lines[] = loadStrings(fileToLoad);  

    columns = lines.length;
    rows = lines[0].length();

    println ("rows: " + rows, "columns: " + columns);

    cellSize = width/rows;

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
      switchToBlue(squares[x][y]);
    } else if (squares[x][y].squareColour == blue) {
      switchToRed(squares[x][y]);
    }
  }

  int switchToBlue(Square squareToCheckFrom) {
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;

    // from red to blue
    if ( !inRange(squareToCheckFrom) || ( squareToCheckFrom.squareColour != red) ) {
      return 0;
    } else {
      x = squareToCheckFrom.x/cellSize;
      y = squareToCheckFrom.y/cellSize;
      squareToCheckFrom.changeColour();
      int up = switchToBlue(squares[x][y-1]);
      int right = switchToBlue(squares[x+1][y]);
      int down = switchToBlue(squares[x][y+1]);
      int left =  switchToBlue(squares[x-1][y]);

      return up + right + down + left + 1;
    }
  }
  int switchToRed(Square squareToCheckFrom) {
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;

    println(x, y);

    // from blue to red
    if ( inRange(squareToCheckFrom) == false || (squareToCheckFrom.squareColour != blue) ) {
      println("not in range. returned 0.");
      return 0;
    } else {
      println("ran the color change bit.");
      x = squareToCheckFrom.x/cellSize;
      y = squareToCheckFrom.y/cellSize;
      squareToCheckFrom.changeColour();
      int up = switchToRed(squares[x][y-1]);
      int right = switchToRed(squares[x+1][y]);
      int down = switchToRed(squares[x][y+1]);
      int left =  switchToRed(squares[x-1][y]);
      println("squares to change: "+ up+right+left+down+1);
      return up + right + down + left + 1;
    }
  }

  boolean inRange(Square squareToCheck) {
    //println("squareToCheck.x/cellSize: " + squareToCheck.x/cellSize + " squareToCheck.y/cellSize: " + squareToCheck.y/cellSize);
    return ((squareToCheck.x/cellSize > 0 && squareToCheck.x/cellSize < rows-1) && (squareToCheck.y/cellSize > 0 && squareToCheck.y/cellSize < columns-1));
  }
}