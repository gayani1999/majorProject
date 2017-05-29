class Square {

  //data
  float sideLength;
  color squareColour;
  float  x, y;

  char squareType;
  boolean isOn;

  //constructor
  Square(float _x, float _y, float _sideLength, char _squareType) {
    x = _x;
    y = _y;
    sideLength = _sideLength;
    squareType = _squareType;
    if (squareType == 'B') { //blue
      squareColour = color(0, 0, 255);

      isOn = true;
    } else if (squareType == 'R') { //red 
      squareColour = color(255, 0, 0);
      isOn = false;
    }
  }

  //behaviour
  void display() {
    stroke(0);

    fill(squareColour);
    rect(x, y, sideLength, sideLength);
  }

  void changeColour() {

    if (isOn == true) {
      squareColour = color(255, 0, 0);
      isOn = false;
    } else if (isOn == false) {
      squareColour = color(0, 0, 255);
      isOn = true;
    }
    display();
  }
  boolean isSwitched() {
    if (isOn == true) {
      squareColour = color(255, 0, 0);
      isOn = false;
    } else if (isOn == false) {
      squareColour = color(0, 0, 255);
      isOn = true;
    }
    display();
    return isOn;
  }
}