//Name: Gayani Rajapaksha
//Project Title: the grid for the major project
//Purpose:  The grid for the major project. Creates it by using coloured squares that change colour once clicked. 


int[][] screen;
int columns, rows;
float cellSize;
Square[] theSquares;
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color yellow = color(255);
Button yellowButton, redButton, blueButton;

void setup() {
  background(0);
  size(600, 600);
  yellowButton  = new Button(width*0.93, height*0.06, yellow);
  blueButton  = new Button(width*0.93, height*0.28, blue);
  redButton = new Button(width*0.93, height*0.49, red);
  yellowButton.display();
  blueButton.display();
  redButton.display();

  columns = 20;
  rows = 20;
  screen = new int[columns][rows];
  cellSize = width/columns*.9;
  theSquares = new Square[columns*rows];
  for (int i=0; i<theSquares.length; i++) {
    theSquares[i] = new Square(cellSize);
  }

  createScreen();
  displayScreen();
}



void draw() {
}

void mousePressed() {
  int x = int(mouseX / cellSize);
  int y = int(mouseY / cellSize);
  println(mouseX, mouseY);
  if(yellowButton.isMouseHovering()){
  
  
    theSquares[x*y].changeColour(int(x*cellSize), int(y*cellSize), yellow);
  }else if(blueButton.isMouseHovering()){
  
  
    theSquares[x*y].changeColour(int(x*cellSize), int(y*cellSize), blue);
  } else if(redButton.isMouseHovering()){
  
  
    theSquares[x*y].changeColour(int(x*cellSize), int(y*cellSize), red);
  }
}


void displayScreen() {
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y< rows; y++) {
      if (screen[x][y] == 0) {

        theSquares[x*y].display(x*cellSize, y*cellSize, blue);
      } else if (screen[x][y] == 1) {

        theSquares[x*y].display(x*cellSize, y*cellSize, red);
      } else if (screen[x][y] == 2) {

        theSquares[x*y].display(x*cellSize, y*cellSize, yellow);
      }
    }
  }
}
void createScreen() {
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      screen[x][y] = int(random(3));
    }
  }
}