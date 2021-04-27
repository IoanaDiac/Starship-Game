class Ship {
  float x, y, vx, vy;
  boolean upPressed, downPressed, leftPressed, rightPressed;
  PImage ship;
  int speed = 8; //speed of ship
  
  Ship() {
    this.x = width/2;
    this.y = height - height/4;
    this.vy = 0;
    this.vx = 0;
    this.ship = loadImage("ship.png");
  }
  
  void drawShip() {
    imageMode(CENTER);
    image(ship, x, y,90,90);
  }
  
  void move() {
    if (upPressed == true) {
      if(y>=30){
      y-= speed;}
    } else if (downPressed == true) {
      if(y<=height-30){
      y+= speed;}
    } 
    
    if (leftPressed == true) {
      if(x>=30){
        x-= speed;}
    } else if (rightPressed == true) {
      if(x<=width-30){
      x+= speed;}
    } 
  }  
}
