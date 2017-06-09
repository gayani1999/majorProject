Level currentLevel;
int gameState = 0;
void setup() {
  size(600, 600);  

  currentLevel = new Level("lvl2.txt");
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
  }
}
void keyPressed() {
  if (currentLevel.levelState == 0) {
    currentLevel.changeSwitchToColour(key);
  }
}