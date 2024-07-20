void EscapeButton() {
  rectMode(CORNER);
  textSize(100);

  if (mouseX>50 && mouseX<100 && mouseY>50 && mouseY<100 && change == true) {
    noFill();
    stroke(255,0,0);
    strokeWeight(5);
    rect(50,50,50,50);
    fill(255, 0, 0);
    text("<", 75, 60);
    
    if (mousePressed) {
      screen = 2;
      if (gameON == true) {
        screen = 3;
      }
    }
  } else {
    fill(255);
    text("<", 75, 60);
  }
}
