Level currentLevel;
int gameState;
int whichLevel;
Button start;
void setup() {
  size(600, 600);  
  gameState = 0;
  start= new Button (width/2, height/2, width/3, height/12, "START");
  whichLevel = 2;
  if (whichLevel == 1) {
    currentLevel = new Level("lvl1.txt", "lvl1moves.json");
  } else if (whichLevel == 2) {
    currentLevel = new Level("lvl2.txt", "lvl2moves.json");
  } else if (whichLevel == 3) {
    currentLevel = new Level("lvl3.txt", "lvl3moves.json");
  } else if (whichLevel == 4) {
    currentLevel = new Level("lvl4.txt", "lvl4moves.json");
  }
}

void draw() {

  goToCorrectPlace();
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  text("Moves Left: ", width*.116, height*.975);
}

void mousePressed() {
  println(mouseX, mouseY);
  println((mouseX/currentLevel.cellSize), mouseY/currentLevel.cellSize);
  if (gameState == 0) {
    //if the mouse is pressed where the start button is switch to state 1
    if (start.isMouseHovering()) {
      gameState = 1;
    }
    if (gameState == 1) {
      displayGameMenu();
    }
  } else if (gameState == 2) {
    if (currentLevel.levelState == 0) {
      currentLevel.movesLeft--;
      currentLevel.changeColour();  
      println("moves Left: " + currentLevel.movesLeft);
    }
  }
}
void keyPressed() {

  currentLevel.changeSwitchToColour(key);
}
void goToCorrectPlace() {
  if (gameState == 0) {
    displayStartScreen();
  } else if (gameState == 1) {
    currentLevel.goToCorrectPlace();
  }
}
void displayStartScreen() {
  background(255);
  start.display();
}
void displayGameMenu() {
}