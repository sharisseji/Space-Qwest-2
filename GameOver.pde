void endScreen() {
  println(mouseX +", "+ mouseY);

  textAlign(CENTER, CENTER);
  textSize(140);
  fill(255, 0, 0);
  text("GAME OVER", width/2, height/2-150);
  highScore = max(score, highScore);

  textSize(60);
  fill(255);
  text("Score: "+ score, width/2, height/2-40);
  textSize(55);
  text("High Score: "+ highScore, width/2, height/2+30);

  //MAIN MENU BUTTON
  if (mouseX>130 && mouseX<430 && mouseY>475 && mouseY<615 && change == true) { 
    fill(200);
    textSize(75);
    text("MAIN", 275, 505);
    text("MENU", 275, 565);

    if (mousePressed) {
      screen = 2; //back to main menu
      change = false;
    }
  } else {
    fill(255);
    textSize(80);
    text("MAIN", 275, 500);
    text("MENU", 275, 570);
  }

  //-------------------------------------------//
  //EXIT BUTTON
  if (mouseX>575 && mouseX< 875 && mouseY>500 && mouseY<590) { 
    fill(200);
    textSize(90);
    text("EXIT", 725, 535);

    if (mousePressed) {
      exit();
    }
  } else {
    fill(255);
    textSize(100);
    text("EXIT", 725, 535);
  }
}
