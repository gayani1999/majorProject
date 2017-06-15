import ddf.minim.*;

Level currentLevel;
int gameState;
Button start, help, playGame;

Minim minim;
AudioPlayer player;
 
void setup() {
  size(600, 600);  
  gameState = 0;
  start= new Button (width/2, height/2.5, width/3, height/12, "START", color(255));
  help= new Button (width/2, height/2, width/3, height/12, "INSTRUCTIONS", color(255));
  playGame= new Button( width *.96, height*.97, color(255));
  
  minim = new Minim(this);

  player = minim.loadFile("Mysterious-Puzzle.mp3");
  createMenuButtons();
}

void draw() {
  player.play();
  goToCorrectPlace();
  
}

void mousePressed() {
  println(mouseX, mouseY);
  //println((mouseX/currentLevel.cellSize), mouseY/currentLevel.cellSize);
  if (gameState == 0) {
    if (start.isMouseHovering()) {
      gameState = 1;
    } else if (help.isMouseHovering()) {
      gameState = 3;
    }
  } else if (gameState == 1) {
    chooseLevelToPlay();
  } else if (gameState == 2) {
    if (currentLevel.levelState == 0) {
      currentLevel.changeColour();
    } else if (currentLevel.levelState == 2) {
      //add reset Button
    }
    if (currentLevel.menu.isMouseHovering()) {
      gameState = 1;
    }
  } else if (gameState == 3) {
    if ( playGame.isMouseHovering()) {
      gameState = 1;
    }
  }
}
void keyPressed() {
  if (currentLevel.levelState == 0) {
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
  background(255);
  start.display();
  help.display();
}

void displayHelpMenu() {
  background(0);
  playGame.display();
}