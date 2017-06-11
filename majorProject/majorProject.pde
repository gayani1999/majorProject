Level currentLevel;
int gameState = 0;
int whichLevel;
void setup() {
  size(600, 600);  
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

  currentLevel.goToCorrectPlace();
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  text("Moves Left: ", width*.116, height*.975);
}

void mousePressed() {
  println(mouseX, mouseY);
  println((mouseX/currentLevel.cellSize), mouseY/currentLevel.cellSize);
  if (currentLevel.levelState == 0) {
    currentLevel.changeColour();
    currentLevel.movesLeft--;
    println("moves Left: " + currentLevel.movesLeft);
  }
}
void keyPressed() {

  currentLevel.changeSwitchToColour(key);
}