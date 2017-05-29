Level currentLevel;

void setup() {


  size(600, 600);  

  currentLevel = new Level("lvl1.txt");
}

void draw() {
  currentLevel.display();
}


void mousePressed() {
  currentLevel.changeColour();
}