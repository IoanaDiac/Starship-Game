class Bullet {
  float x, y, vy,size;

  
  Bullet(Ship playerShip) {
    this.x = playerShip.x;
    this.y = playerShip.y - 15;
    this.vy = -10;
    this.size = 15;
  }
  
  void drawBullet() {
    y+=vy;
    strokeWeight(4);
    stroke(255,127,80);
    fill(255,69,0);
    ellipse(x, y, size, size);
    
  }

}
