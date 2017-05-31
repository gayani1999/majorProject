class Square {

  //data
  float sideLength;
  color squareColour;
  int  x, y;
  color red = color (255, 0, 0);
  color blue = color (0, 0, 255);
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
    }
  }

  //behaviour
  void display() {
    noStroke();
    //stroke(0);
    fill(squareColour);
    rect(x, y, sideLength, sideLength);
  }



  void changeColour(color switchTo) {

    squareColour = switchTo;
    display();
  }
}