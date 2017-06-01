class Level { //<>// //<>//

  Square[][] squares;
  color blue = color(0, 0, 255);
  color red = color(255, 0, 0);
  color white = color(255);
  color purple = color(255, 0, 255);
  color colorToSwitchTo;
  Button whiteButton, redButton, blueButton, purpleButton;
  int columns, rows, cellSize;
  int state;

  Level(String fileToLoad) {


//    state = 0;
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
 //   loadButtons();
  }

  //void changeColour() {
  //  int x = mouseX/cellSize;
  //  int y = mouseY/cellSize;
  //  if (squares[x][y].squareColour == red) {
  //    switchToBlue(squares[x][y]);
  //  } else if (squares[x][y].squareColour == blue) {
  //    switchToRed(squares[x][y]);
  //  }
  //}

  //int switchToBlue(Square squareToCheckFrom) {
  //  int x = mouseX/cellSize;
  //  int y = mouseY/cellSize;

  //  // from red to blue
  //  if ( !inRange(squareToCheckFrom) || ( squareToCheckFrom.squareColour != red) ) {
  //    return 0;
  //  } else {
  //    //int x = squareToCheckFrom.x/cellSize;
  //    //int y = squareToCheckFrom.y/cellSize;
  //    squareToCheckFrom.changeColour();
  //    int up = switchToBlue(squares[x][y-1]);
  //    int right = switchToBlue(squares[x+1][y]);
  //    int down = switchToBlue(squares[x][y+1]);
  //    int left =  switchToBlue(squares[x-1][y]);

  //    return up + right + down + left + 1;
  //  }
  //}
  //int switchToRed(Square squareToCheckFrom) {
  //  int x = mouseX/cellSize;
  //  int y = mouseY/cellSize;

  //  println(x, y);

  //  // from blue to red
  //  if ( inRange(squareToCheckFrom) == false || (squareToCheckFrom.squareColour != blue) ) {
  //    println("not in range. returned 0.");
  //    return 0;
  //  } else {
  //    println("ran the color change bit.");
  //    //int x = squareToCheckFrom.x/cellSize;
  //    //int y = squareToCheckFrom.y/cellSize;
  //    squareToCheckFrom.changeColour();
  //    int up = switchToRed(squares[x][y-1]);
  //    int right = switchToRed(squares[x+1][y]);
  //    int down = switchToRed(squares[x][y+1]);
  //    int left =  switchToRed(squares[x-1][y]);
  //    return up + right + down + left + 1;
  //  }
  //}
  //void loadButtons() {
  //  whiteButton  = new Button(width*0.95, height*0.1, white);
  //  blueButton  = new Button(width*0.95, height*0.3, blue);
  //  redButton = new Button(width*0.95, height*0.5, red);
  //  purpleButton = new Button(width*0.95, height*0.7, purple);
  //  whiteButton.display();
  //  blueButton.display();
  //  redButton.display();
  //  purpleButton.display();
  //}

  void switchTo() {
     if (state == 0) { 
    if (whiteButton.isMouseHovering()) {
      println("white");
      colorToSwitchTo = white;
    } else if (blueButton.isMouseHovering()) {
     // println("blue");
      colorToSwitchTo = blue;
    } else if (redButton.isMouseHovering()) {

      colorToSwitchTo = red ;
      //println("red");
    }
    state = 1;
    // println(colorToSwitchTo);
  }
  if (state == 1 && mousePressed) {

    int x = int(mouseX / cellSize);
    int y = int(mouseY / cellSize);
    println(x*y);
    if( x < rows && y > columns){
    squares[x][y].changeColour(colorToSwitchTo);
    state = 0;
    }
  }
  }

  boolean inRange(Square squareToCheck) {
    //println("squareToCheck.x/cellSize: " + squareToCheck.x/cellSize + " squareToCheck.y/cellSize: " + squareToCheck.y/cellSize);
    return ((squareToCheck.x/cellSize >= 0 && squareToCheck.x/cellSize < rows) && (squareToCheck.y/cellSize >= 0 && squareToCheck.y/cellSize < columns));
  }
}