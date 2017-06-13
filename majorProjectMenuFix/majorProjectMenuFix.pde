Level currentLevel;
int gameState;


void setup() {
  size(600, 600);  
  gameState = 0;
  start= new Button (width/2, height/2, width/3, height/12, "START", color(255));
  createMenuButtons();
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
//println((mouseX/currentLevel.cellSize), mouseY/currentLevel.cellSize);
  if (gameState == 0) {

    if (start.isMouseHovering()) {
      gameState = 1;
    }
    if (gameState == 1) {
   chooseLevelToPlay();
  
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
    displayGameMenu();
  } else if (gameState == 2) {
    currentLevel.goToCorrectPlace();
  }
}