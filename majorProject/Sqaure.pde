class Square {

  //data
  float sideLength;
  color squareColour;
  int  x, y;
  color colour1, colour2, colour3, colour4, black;
  char squareType;

  //constructor
  Square(int _x, int _y, float _sideLength, char _squareType) {
    x = _x;
    y = _y;
    sideLength = _sideLength;
    squareType = _squareType;
    
    colour1 = color (80, 90, 126);
    colour2 = color (89, 237, 166);
    colour4 = color(69, 120, 227);
    colour3 = color(255, 121, 184);
    black = color(0);
    if (squareType == 'R') { //colour2
      squareColour = colour1;
    } else if (squareType == 'B') { //colour1 
      squareColour = colour2;
    } else if (squareType == 'P') { //colour4
      squareColour = colour3;
    } else if (squareType == 'Y') { //colour3
      squareColour = colour4;
    } else if (squareType == 'X') { //black (for the edges)
      squareColour = black;
    }
  }

  //behaviour
  void display() {
    noStroke();
    //stroke(255);
    fill(squareColour);
    rect(x, y, sideLength, sideLength, 20);
  }

  void changeColour(color colourToSwitchTo) {
    squareColour = colourToSwitchTo;
    display();
  }
}