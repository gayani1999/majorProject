Level currentLevel;

void setup() {


  size(600, 600);  

  currentLevel = new Level("lvl1.txt");
}

void draw() {
  currentLevel.display();
 // currentLevel.loadButtons();
 

}


void mousePressed() {
  println(mouseX, mouseY);
  currentLevel.changeColour();
 
}
void keyPressed(){


}