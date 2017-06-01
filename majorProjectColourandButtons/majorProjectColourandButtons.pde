Level currentLevel;
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color white = color(255);
color purple = color(255, 0, 255);
// color colorToSwitchTo;
Button whiteButton, redButton, blueButton, purpleButton;


void setup() {

  size(600, 600);  
  background(100);
  currentLevel = new Level("lvl1.txt");
  whiteButton  = new Button(width*0.95, height*0.1, white);
  blueButton  = new Button(width*0.95, height*0.3, blue);
  redButton = new Button(width*0.95, height*0.5, red);
  purpleButton = new Button(width*0.95, height*0.7, purple);
}

void draw() {
  currentLevel.display();
  //loadButtons();
}


void mousePressed() {
  //  currentLevel.changeColour();
  currentLevel.switchTo();
}
void loadButtons() {

  whiteButton.display();
  blueButton.display();
  redButton.display();
  purpleButton.display();
}