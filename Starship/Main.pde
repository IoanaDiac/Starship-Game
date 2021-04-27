//Diaconu Ioana - Aerospace Engineering

//Source:
//https://www.openprocessing.org/sketch/1032755
//https://www.openprocessing.org/sketch/753523




import processing.sound.*;
ArrayList<Star> stars = new ArrayList<Star>();
int frequency = 4; //frequency of stars
SoundFile hitSound, endSound ;
Ship playerShip;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
int asteroidFrequency = 60; // initial
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int points;
int start;
EndScene end;
int endT;
int timeSpent ; // Seconds spent
int m ;

void setup() {
  int start = millis();
  size(700, 700);
  playerShip = new Ship();
  points = 0;
  hitSound = new SoundFile(this, "asteroid.wav");
  endSound = new SoundFile(this, "die.wav");
}

void draw() {

  if (end != null) {
    end.drawEndScene();
    
  } else { 
    background(0);
    starFreq();

    asteroidFreq();
    for (int i = 0; i<bullets.size(); i++) {
      bullets.get(i).drawBullet();
    }
    playerShip.drawShip();
    playerShip.move();
    Time();
    stroke(255);
    fill(#187bcd);
    textSize(30);
    text("Points: " + points, 100, 50);
    text("Time: " +m + ": " +timeSpent,100,100 );

    checkCollision();
  }
}


void checkCollision() {
  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    if (a.checkCollision(playerShip) == true) {
      end = new EndScene(points);
    }
    for (int b = 0; b < bullets.size(); b++) {
      Bullet bullet = bullets.get(b);
      if (a.checkCollision(bullet) == true) {
        points++;
        asteroids.remove(a);
        bullets.remove(bullet);
        i--;
        b--;
      }
    }
  }
}

void Time() {
  endT = millis();
  timeSpent = (endT - start) / 1000; // Seconds spent
  m = timeSpent / 60;
  timeSpent -= m * 60;
}

void asteroidFreq() {
  if(points<40){
  asteroidFrequency= 60-points;}
  else{asteroidFrequency=20;} 
  if (frameCount % asteroidFrequency == 0) {
    asteroids.add(new Asteroid());
  }
  for (int i = 0; i<asteroids.size(); i++) {
    Asteroid currentAsteroid = asteroids.get(i);
    currentAsteroid.drawAsteroid();
    if (currentAsteroid.y > height + currentAsteroid.d) {
      asteroids.remove(currentAsteroid);
      i--;
      points--;
      if(points <= 0){
         end = new EndScene(points);
         endSound.play();
      }
    }
  }
}

void starFreq() {
  if (frameCount % frequency == 0) {
    Star myStar = new Star();
    stars.add(myStar);
  }
  for (int i = 0; i<stars.size(); i++) {
    Star currentStar = stars.get(i);
    currentStar.drawStar();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      playerShip.upPressed = true;
    } else if (keyCode == DOWN) {
      playerShip.downPressed = true;
    } else if (keyCode == LEFT) {
      playerShip.leftPressed = true;
    } else if (keyCode == RIGHT) {
      playerShip.rightPressed = true;
    }
  } else if (key == ' ') {
    Bullet b = new Bullet(playerShip);
    bullets.add(b);
  }
}

void keyReleased() {
  if (keyCode == UP) {
    playerShip.upPressed = false;
  } else if (keyCode == DOWN) {
    playerShip.downPressed = false;
  } else if (keyCode == LEFT) {
    playerShip.leftPressed = false;
  } else if (keyCode == RIGHT) {
    playerShip.rightPressed = false;
  }
}

void mousePressed() {
  if (end != null && end.mouseOverButton() == true) {
    resetGame();
  }
}

void resetGame() {
  stars.clear();
  bullets.clear();
  asteroids.clear();
  playerShip = new Ship();
  end = null;
  points = 0;
}
