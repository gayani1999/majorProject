import ddf.minim.*;

Level currentLevel;
int gameState;
Button start, help, playGame;
PImage instructions;

Minim minim;
AudioPlayer player;

void setup() {
  size(600, 600);  
  gameState = 0;
  start= new Button (width/2, height/2.5, width/3, height/12, "START", color(255));
  help= new Button (width/2, height/2, width/3, height/12, "INSTRUCTIONS", color(255));
  playGame= new Button( width *.95, height*.95, width/12, height/12,"MENU", color (255));
  instructions = loadImage("instructions.png");
  minim = new Minim(this);

  player = minim.loadFile("Mysterious-Puzzle.mp3");
  createMenuButtons();
}

void draw() {
  player.play();
  goToCorrectPlace();
}

void mousePressed() {
  if (gameState == 0) { //show start screen
    if (start.isMouseHovering()) {
      gameState = 1; //level menu
    } else if (help.isMouseHovering()) {
      gameState = 3; //instructions 
    }
  } else if (gameState == 1) {
    chooseLevelToPlay(); 
  } else if (gameState == 2) { //playing game
    if (currentLevel.levelState == 0) {
      currentLevel.changeColour(); 
    } 
    if (currentLevel.menu.isMouseHovering()) {
      gameState = 1; //during game return to level menu
    }
  } else if (gameState == 3) {
    if ( playGame.isMouseHovering()) {
      gameState = 1; //after reading instructions go to level menu
    }
  }
}
void keyPressed() {
  if (currentLevel.levelState == 0) { //only do this when the game is actually being played
    currentLevel.changeSwitchToColour(key);
  }
}

void goToCorrectPlace() {
  if (gameState == 0) {
    displayStartScreen();
  } else if (gameState == 1) {
    displayGameMenu();
  } else if (gameState == 2) {
    currentLevel.goToCorrectPlace();
  } else if (gameState == 3) {
    displayHelpMenu();
  }
}

void displayStartScreen() {
  textSize(40);

  background(255);
  start.display();
  help.display();
}

void displayHelpMenu() {
  background(255);
  playGame.display();
  instructions.resize(int(width*.912), int(height/2));
  imageMode(CENTER);
  image(instructions, width/2, height/2);
}