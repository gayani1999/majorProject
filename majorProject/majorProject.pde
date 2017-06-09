Level currentLevel;
int state = 0;
void setup() {
  size(600, 600);  

  currentLevel = new Level("lvl2.txt");

  currentLevel.display();
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

  currentLevel.changeColour();
}
void keyPressed() {
  currentLevel.changeSwitchToColour(key);
}
void goToCorrectPlace() {
  if (currentLevel.state == 0) {
    background(0);
    currentLevel.display();
  } else if (currentLevel.state == 1) {
    background(255);
  }
}