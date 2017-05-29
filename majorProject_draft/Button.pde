class Button {
  //data
  float x, y;
  float theWidth, theHeight;
  float fontSize;
  color backgroundColour, fontColour, hoverBackgroundColour, hoverFont;
  String label;
  boolean hasBeenClicked;

  //constructor
  Button() {

    theWidth = width * 0.4;
    theHeight = height * 0.2;
    backgroundColour = color(0);
    fontColour = color(255);
    hoverBackgroundColour = color(150);
    hoverFont =  color(0);
    fontSize = theWidth * 0.2;
    hasBeenClicked = false;
  }

  Button(float _x, float _y, String _label) {
    x = _x;
    y = _y;
    label = _label;
  }
  //behaviour
  void display() {
    if (mouseIsHovering()) {
      focusedDisplay();
    } else {
      unfocusedDisplay();
    }
  }
  boolean mouseIsHovering() {
    if ( (mouseX > x - theWidth/2) && (mouseX < x + theWidth/2) && (mouseY > y - theHeight/2) && (mouseY < y + theHeight/2)) {
      return true;
    } else {
      return false;
    }
  }
  void checkForCLick() {
    if (mouseIsHovering()) {
      hasBeenClicked = true;
    }
  }
  boolean isClicked() {
    return hasBeenClicked;
  }

  void unfocusedDisplay() {
    rectMode(CENTER);
    fill(backgroundColour);
    rect(x, y, theWidth, theHeight);
    fill(fontColour);
    textAlign(CENTER, CENTER);
    textSize(fontSize);
    text(label, x, y);
  }
  void focusedDisplay() {
    rectMode(CENTER);
    fill(hoverBackgroundColour);
    rect(x, y, theWidth, theHeight);
    fill(hoverFont);
    textAlign(CENTER, CENTER);
    textSize(fontSize);
    text(label, x, y);
  }
}