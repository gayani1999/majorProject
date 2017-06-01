class Button {
  //data
  float x, y;
  float theWidth, theHeight;
  float fontSize;
  color backgroundColor, fontColor, hoverBackgroundColor, hoverFont;
  String label;
  boolean hasBeenClicked;

  //constructor(s)
  Button() {
    x = width/2;
    y = height/2;
    theWidth = width * 0.4;
    theHeight = height *0.2;
    backgroundColor = color(0);
    fontColor = color(255);
    hoverBackgroundColor = color(150);
    hoverFont = color(0);
    label = "Testing";
    fontSize = theWidth * 0.2;
    hasBeenClicked = false;
  }
  
  Button(float _x, float _y, String _label) {
    x = _x;
    y = _y;
    label = _label;
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

  //Button(float x, float y, String label) {
  //  this.x = x;
  //  this.y = y;
  //  this.label = label;
  //}

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