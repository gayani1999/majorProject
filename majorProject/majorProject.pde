Level currentLevel;
int state = 0;
void setup() {
  size(600, 600);  

  currentLevel = new Level("lvl1.txt");
}

void draw() {
currentLevel.goToCorrectPlace();

}

void mousePressed() {
  println(mouseX, mouseY);
  println((mouseX/currentLevel.cellSize), mouseY/currentLevel.cellSize);
  currentLevel.changeColour();
}
void keyPressed() {
  currentLevel.changeSwitchToColour(key);
}