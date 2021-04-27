class EndScene {

  int buttonX, buttonY, buttonW, buttonH;
  PImage background= loadImage("background.png");
  
  EndScene(int points) {
    this.buttonW = 200;
    this.buttonH = 100;
    this.buttonX = width/2 - this.buttonW/2;
    this.buttonY = height/2 - this.buttonH/2;
  }

  void drawEndScene() {
    
    image(background, width/2, height/2, width, height);

    textSize(width/10);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Game Over!", width/2, height/2-width/6);
    
    fill(70);
    stroke(0);
    strokeWeight(6);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(#2a9df4);
    textAlign(CENTER, CENTER);
    text("Retry", width/2, height/2-10);

    stroke(255);
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Your final Score is " + points, width/2, height - height/4);
    text("Your final Time is " +m + "min " +timeSpent +"sec", width/2, height - 220);
}

  boolean mouseOverButton() {
    return (mouseX > buttonX 
      && mouseX < buttonX + buttonW
      && mouseY > buttonY
      && mouseY < buttonY + buttonH);
  }
}
