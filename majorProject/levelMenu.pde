Button lvl1, lvl2, lvl3, lvl4, lvl5, lvl6;
color levelButtonColour = color (89, 237, 166);
void createMenuButtons() {
  lvl1 = new Button(width/10, height/8, width/10, height/10, "1", levelButtonColour);
  lvl2 = new Button(width/3.3, height/8, width/10, height/10, "2", levelButtonColour);
  lvl3 = new Button(width/2, height/8, width/10, height/10, "3", levelButtonColour);
  lvl4 = new Button(width/1.4, height/8, width/10, height/10, "4", levelButtonColour);
  lvl5 = new Button(width/1.1, height/8, width/10, height/10, "5", levelButtonColour);
  lvl6 = new Button(width/10, height/3.08, width/10, height/10, "6", levelButtonColour);
}
void displayGameMenu() {
  background(255);
  lvl1.display();
  lvl2.display();
  lvl3.display();
  lvl4.display();
  lvl5.display();
  lvl6.display();
}

void chooseLevelToPlay() { //based on level selected create said level

  if (lvl1.isMouseHovering()) {
    currentLevel = new Level("lvl1.txt", 2); //level class takes in the text file with the level design and the number of moves given
    gameState = 2;
  } else if (lvl2.isMouseHovering()) {
    currentLevel = new Level("lvl2.txt", 2);
    gameState = 2;
  } else if (lvl3.isMouseHovering()) {
    currentLevel = new Level("lvl3.txt", 2);
    gameState = 2;
  } else if (lvl4.isMouseHovering()) {
    currentLevel = new Level("lvl4.txt", 3);
    gameState = 2;
  } else if (lvl5.isMouseHovering()) {
    currentLevel = new Level("lvl5.txt", 2);
    gameState = 2;
  } else if (lvl6.isMouseHovering()) {
    currentLevel = new Level("lvl6.txt", 3);
    gameState = 2;
  } else {
    gameState = 1;
  }
}