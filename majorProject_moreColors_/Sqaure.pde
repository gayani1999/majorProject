class Square {

  //data
  float sideLength;
  color squareColour;
  int  x, y;
  color red = color (255, 0, 0);
  color blue = color (0, 0, 255);
  color yellow = color(255,255,0);
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
    }
  }

  //behaviour
  void display() {
    noStroke();

    fill(squareColour);
    rect(x, y, sideLength, sideLength);
  }

  void changeColour() {

    if (squareColour == blue){
      if(mouseButton == LEFT){
      squareColour = red;
      } else  if(mouseButton == RIGHT){
      squareColour = yellow;
      }
    } else if (squareColour == red) {
       if(mouseButton == LEFT){
      squareColour = yellow;
      } else  if(mouseButton == RIGHT){
      squareColour = blue;
      }
    } else if (squareColour == yellow) {
       if(mouseButton == LEFT){
      squareColour = blue;
      } else  if(mouseButton == RIGHT){
      squareColour = red;
      }
    }
    display();
  }
}