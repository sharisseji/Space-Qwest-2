void startMenu() {
  println(mouseX +", "+ mouseY);

  textAlign(CENTER, CENTER);
  fill(210);
  textSize(125);
  text("SPACE", 500, 100);

  fill(30, 10, 210);
  textSize(200);
  text("QWEST", 500, 200);

  fill(175); //230,10,10
  textSize(300);
  text("2", 500, 350);

  //-------------------------------------------//
  //PLAY GAME BUTTON
  if (mouseX>50 && mouseX<450 && mouseY>570 && mouseY<670 && change == true) { //play button
    fill(200);
    textSize(70);
    text("PLAY", 250, 615);

    if (mousePressed) {
      gameON = true;
      screen = 3; //actual game
      change = false;
    }
  } else {
    fill(255);
    textSize(80);
    text("PLAY", 250, 610); //("text", x, y)
  }

  //-------------------------------------------//
  //CONTROLS BUTTON
  if (mouseX>550 && mouseX< 950 && mouseY>570 && mouseY<670 && change == true) { //controls button   
    fill(200);
    textSize(60);
    text("CONTROLS", 750, 615);

    if (mousePressed) {
      clear();
      screen = 4; //controls menu
      change = false;
    }
  } else {    
    fill(255);    
    textSize(70);
    text("CONTROLS", 750, 610);
  }
}
