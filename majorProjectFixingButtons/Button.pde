class Button {
  //data
  float x, y;
  float theWidth, theHeight;
  float fontSize;
  color backgroundColor, fontColor, hoverBackgroundColor, hoverFont;
  String label;
  boolean hasBeenClicked;
  int whichLevel;

  //constructor

  Button(float _x, float _y, float _theWidth, float _theHeight, String _label, color _backgroundColor) {
    x = _x;
    y = _y;
    label = _label;
    theWidth  = _theWidth;
    theHeight  = _theHeight;
    backgroundColor = _backgroundColor;
    fontColor = color(0);
    hoverBackgroundColor = color(0);
    hoverFont = color(255);
    fontSize = theWidth * 0.15;
    hasBeenClicked = false;
 
  }
  Button(float _x, float _y, color _colour) {
    x = _x;
    y = _y;
    backgroundColor = _colour;
    label = " ";
    theWidth = width * 0.045;
    theHeight = height *0.045;
    fontSize = 1;
  }

  //behaviour
  void display() {
    if ( isMouseHovering() ) {
      focusedDisplay();
    } else {
      unfocusedDisplay();
    }
  }

  void checkForClick() {
    if (isMouseHovering()) {
      hasBeenClicked = true;
    }
  }

  boolean isClicked() {
    return hasBeenClicked;
  }

  boolean isMouseHovering() {
    if ( (mouseX > x - theWidth/2) && (mouseX < x + theWidth/2) &&
      (mouseY > y - theHeight/2) && (mouseY < y + theHeight/2)) {
      return true;
    } else {
      return false;
    }
  }

  void unfocusedDisplay() {
    rectMode(CENTER);
    fill(backgroundColor);
    rect(x, y, theWidth, theHeight);
    fill(fontColor);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }

  void focusedDisplay() {
    rectMode(CENTER);
    fill(hoverBackgroundColor);
    rect(x, y, theWidth, theHeight);
    fill(hoverFont);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
}