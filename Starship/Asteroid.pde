  

class Asteroid {
  float d, x, y;
  PImage asteroid;
  int vy = 5; //initial
  
  Asteroid() {
    this.d = random(70, 200);
    this.x = random(width);
    this.y = -d/2;
    this.asteroid = loadImage("asteroids.png");
    
  }

  void drawAsteroid() {

    imageMode(CENTER);
    image(asteroid, x, y,d,d);
    y+=vy;
    vy=5+(m*60+timeSpent)/10;
    
  }

  boolean checkCollision(Object other) {
    if (other instanceof Ship) {
      Ship playerShip = (Ship) other;
      
      float distance = dist(x, y, playerShip.x, playerShip.y);
      if (distance < d/2+15 ) {
        endSound.play();
        
        return true;
      }
    } else if (other instanceof Bullet) {
      Bullet bullet = (Bullet) other;
      float distance = dist(x, y, bullet.x, bullet.y); 
      println(distance);
      if (distance <= d/2 + bullet.size/2 ) {
        fill(0, 255, 0, 100);
        rect(0, 0, width, height);
        fill(255);
        hitSound.play();
        return true;
      }
    }
    return false;
    
  }
}
