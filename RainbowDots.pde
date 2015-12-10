Circle[] myCircles = new Circle[15];
Circle currentCircle = new Circle();

void setup() {
  size(1000, 700);
  stroke(0, 0, 0);

  //noStroke();
  noFill();

  colorMode(HSB);

  for (int i = 0; i < myCircles.length; i++) {
    myCircles[i] = new Circle();
    myCircles[i].setStartTime();
  }
}


void draw() {

  background(0, 0, 255);

  for (int i = 0; i < myCircles.length; i++) {
    currentCircle = myCircles[i];
    currentCircle.updateCircle();
    currentCircle.renderCircle();
  }
}




class Circle {
  float x;
  float y;
  float r;
  float r2;

  float startTime;

  float h; //hue (color)
  float t = 255; //transparency

  Circle() {
    r = random(-10, 0); //starting circle radius
    r2 = 100; //ending circle radius
    randomPosition(); // give the circle a random position
  }

  void renderCircle() { 
    //fill(h, 255, 255, t);
    strokeWeight(50*(1-(r/r2)));//decrease stroke weight (as a percentage of the radius)
    stroke(h, 255, 255, t);
    ellipse(x, y, r*2, r*2); //display solid circle on screen
  }

  void updateCircle() {
    if (millis() >= startTime) {
      r = lerp(r, r2, 0.03); // increase raduis to max radius
      t = (255*(1-(r/r2))); //decrease transparency (as a percentage of the radius)
    }

    if (r >= r2*.95) {
      r = 0;
      t = 255;
      randomPosition(); //reset the circle to a random position
      randomColor(); //reset the circle color to a random color
      setStartTime(); //set the spaw rate of the circle +1-3 seconds from the current time
    }
  }

  void randomPosition() {
    x = random(r, width-r); //random width position
    y = random(r, height-r); //random height position
  }

  void randomColor() {
    h = random(0, 255); //give the circle a random hue (color);
  }

  void setStartTime() {
    startTime = millis() + random(1000, 5000); //set the spaw rate of the circle +1-5 seconds from the current time
  }
}
