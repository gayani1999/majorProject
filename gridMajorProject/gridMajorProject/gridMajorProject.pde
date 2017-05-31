//Name: Gayani Rajapaksha
//Project Title: the grid for the major project
//Purpose:  The grid for the major project. Creates it by using coloured squares that change colour once clicked. 


int[][] screen;
int columns, rows;
float cellSize;
Square[][] theSquares;
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color white = color(255);
color purple = color(255,0,255);
color colorToSwitchTo;
Button whiteButton, redButton, blueButton, purpleButton;
int state;

void setup() {
  size(600, 600);
  background(0);
//  translate(width/6, height/6);
  whiteButton  = new Button(width*0.93, height*0.1, white);
  blueButton  = new Button(width*0.93, height*0.3, blue);
  redButton = new Button(width*0.93, height*0.5, red);
  purpleButton = new Button(width*0.93, height*0.7, purple);
  
  whiteButton.display();
  blueButton.display();
  redButton.display();
  purpleButton.display();
  state = 0;  
  columns = 11;
  rows = 11;
  screen = new int[columns][rows];
  cellSize = width*.75/columns;
  theSquares = new Square[columns][rows];
  for (int i=0; i<theSquares.length; i++) {
     for (int j = 1; j< rows; j++)
    theSquares[i][j] = new Square(cellSize);
  }

  createScreen();
  displayScreen();
}



void draw() {
}

void mousePressed() {

  println(mouseX, mouseY);
  if (state == 0) { 
    if (whiteButton.isMouseHovering()) {
      //println("white");
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
    theSquares[x][y].changeColour(x, y, colorToSwitchTo);
    state = 0;
    }
  }
}


void displayScreen() {
  for (int x = 1; x < columns; x++) {
    for (int y = 1; y< rows; y++) {
      if (screen[x][y] == 0) {

        theSquares[x][y].display(x*cellSize, y*cellSize, blue);
      } else if (screen[x][y] == 1) {

        theSquares[x][y].display(x*cellSize, y*cellSize, red);
      } else if (screen[x][y] == 2) {

        theSquares[x][y].display(x*cellSize, y*cellSize, white);
      }else if (screen[x][y] == 3) {

        theSquares[x][y].display(x*cellSize, y*cellSize, purple);
      }
    }
  }
}
void createScreen() {
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      screen[x][y] = int(random(4));
    }
  }
}