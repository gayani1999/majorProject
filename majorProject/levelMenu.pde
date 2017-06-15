Button lvl1, lvl2, lvl3, lvl4, lvl5;
color levelButtonColour = color (89, 237, 166);
void createMenuButtons() {
  lvl1 = new Button(width/10, height/8, width/10, height/10, "1", levelButtonColour);
  lvl2 = new Button(width/3.3, height/8, width/10, height/10, "2", levelButtonColour);
  lvl3 = new Button(width/2, height/8, width/10, height/10, "3", levelButtonColour);
  lvl4 = new Button(width/1.4, height/8, width/10, height/10, "4", levelButtonColour);
  lvl5 = new Button(width/1.1, height/8, width/10, height/10, "5", levelButtonColour);
}
void displayGameMenu() {
  background(255);
  lvl1.display();
  lvl2.display();
  lvl3.display();
  lvl4.display();
  lvl5.display();
}

void chooseLevelToPlay() {

  if (lvl1.isMouseHovering()) {
    currentLevel = new Level("lvl1.txt", "lvl1moves.json");
  } else if (lvl2.isMouseHovering()) {
    currentLevel = new Level("lvl2.txt", "lvl2moves.json");
  } else if (lvl3.isMouseHovering()) {
    currentLevel = new Level("lvl3.txt", "lvl3moves.json");
  } else if (lvl4.isMouseHovering()) {
    currentLevel = new Level("lvl4.txt", "lvl4moves.json");
  } else if (lvl5.isMouseHovering()) {
    currentLevel = new Level("lvl5.txt", "lvl5moves.json");
  } else {
    gameState = 1;
  }
  gameState = 2;
}