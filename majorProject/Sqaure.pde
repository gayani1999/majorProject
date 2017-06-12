class Square {

  //data
  float sideLength;
  color squareColour;
  int  x, y;
  color red, blue, purple, yellow, black;
  char squareType;

  //constructor
  Square(int _x, int _y, float _sideLength, char _squareType) {
    x = _x;
    y = _y;
    sideLength = _sideLength;
    squareType = _squareType;
    red = color (255, 0, 0);
    blue = color (0, 0, 255);
    yellow = color(255, 255, 0);
    purple = color(255, 0, 255);
    black = color(0);
    if (squareType == 'B') { //blue
      squareColour = blue;
    } else if (squareType == 'R') { //red 
      squareColour = red;
    } else if (squareType == 'Y') { //yellow
      squareColour = yellow;
    } else if (squareType == 'P') { //purple
      squareColour = purple;
    } else if (squareType == 'X') { //black (for the edges)
      squareColour = black;
    }
  }

  //behaviour
  void display() {
    noStroke();

    fill(squareColour);
    rect(x, y, sideLength, sideLength);
  }

  void changeColour(color colourToSwitchTo) {
    squareColour = colourToSwitchTo;
    display();
  }
}