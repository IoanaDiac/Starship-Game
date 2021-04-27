class Star {
  float x, y;
  int vy;
  
  Star() { //CONSTRUCTOR
    this.x = random(width);
    this.y = 0;
    this.vy = 8;
  }
  
  void drawStar() {
    y+=vy;
    noStroke();
     for (int i = 1; i < 20; i++) {
      fill(float(i)*6);
      ellipse(x, y, 40-(2*i), 40-(2*i)); //circle gradient
     }    
  }
}
