class Square {

  //data
  float sideLength;
  color squareColour;
  float  x, y;

  //constructor
  Square(float _sideLength) {
    sideLength = _sideLength;

  }


  //behaviour
  void display(float _x, float _y, color _squareColour) {
    x = _x;
    y = _y;
    squareColour = _squareColour;
    noStroke();

    fill(squareColour);
    rect(x, y, sideLength, sideLength);
  }


  void changeColour(int x, int y, color switchTo) {

    squareColour = switchTo;
    display(x, y, squareColour);
  }

}