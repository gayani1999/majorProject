class Square {

  //data
  float sideLength;
  color squareColour;
  int  x, y;
  color red = color (255, 0, 0);
  color blue = color (0, 0, 255);
  color yellow = color(255, 255, 0);
  color purple = color(255, 0, 255);
  color black = color(0);
  char squareType;


  //constructor
  Square(int _x, int _y, float _sideLength, char _squareType) {
    x = _x;
    y = _y;
    sideLength = _sideLength;
    squareType = _squareType;
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
    //noStroke();
    stroke(255);
    fill(squareColour);
    rect(x, y, sideLength, sideLength);
  }

  void changeColour() {

    if (squareColour == blue) {
      squareColour = color(255, 0, 0);
    } else if (squareColour == red) {
      squareColour = color(0, 0, 255);
    }
    display();
  }
  void changeColour(color colourToSwitchTo) {
    squareColour = colourToSwitchTo;
    display();
  }
}