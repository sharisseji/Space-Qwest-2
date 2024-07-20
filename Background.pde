void redrawGameField() {
  image(gameBG1, gameBG1X, gameBG1Y);
  image(gameBG2, gameBG2X, gameBG2Y);

  for (int i = 0; i <100; i++) {
    if (ballVisible[i] == true) {
      fill(220, 180, 80);
      image(asteroid[i], ballX[i], ballY[i]);
    }// second part of this code is in otherpowerup()
  }
  image(ship1, shipX, shipY);
}

//-------------------------------------------//
//GAME SCROLLING BACKGROUND
void moveBackground() {
  gameBG1Y = gameBG1Y + bgdSpeed; // if an object moves to the right that means the backward moves to the left to create an illusion 

  if (gameBG1Y+bgdSpeed > gameBG1H) gameBG1Y = -gameBG2H;


  gameBG2Y = gameBG2Y + bgdSpeed; // same checks apply to the seocnd bgd. 
  if (gameBG2Y+bgdSpeed > gameBG2H) gameBG2Y = -gameBG1H;// move it behind the first when it is out of the screen.
}

//-------------------------------------------//
//START MENU BACKGROUND (animated)
void loadStartBG() {
  for (int i=0; i< bg1numF; i++) {
    bg1Images[i] = loadImage ("startupbg"+nf(i, 2)+".png"); 
    bg1Images[i].resize(1010, 950);
  }
}

void drawStartBG() {
  if (startBG == true) {
    frameRate(20);
    image (bg1Images[bg1cF], -10, -75);
    bg1cF++;
    if (bg1cF >= 25) {
      bg1cF = 0;
    }
  }
  if (screen != 2) {
    frameRate(75);
    startBG = false;
    bg1cF = 0;
  }
}
//-------------------------------------------//
//CONTROL MENU BACKGROUND (animated)
void loadControlBG(){
  for (int i=1; i< bg2numF; i++) {
    bg2Images[i] = loadImage ("controlbg"+ str(i)+".gif"); 
    bg2Images[i].resize(1240, 750);
  }
}

void drawControlBG(){
  if (startBG2 == true) {
    frameRate(10);
    
    image (bg2Images[bg2cF], -75, 0);
    bg2cF++;
    if (bg2cF >= 4) {
      bg2cF = 1;
    }
  }
  if (screen != 4) {
    frameRate(75);
    startBG2 = false;
    bg2cF = 1;
  }
}

//-------------------------------------------//
//GAME OVER BACKGROUND (animated)
void loadEndBG(){
  for (int i=0; i< bg3numF; i++) {
    bg3Images[i] = loadImage ("gameoverbg1"+ nf(i,2)+".png"); 
    bg3Images[i].resize(1000, 750);
  }
}

void drawEndBG(){
  if (startBG3 == true) {
    frameRate(10);
    
    image (bg3Images[bg3cF], 0, 0);
    bg3cF++;
    if (bg3cF >= 12) {
      bg3cF = 0;
    }
  }
  if (screen != 5) {
    frameRate(75);
    startBG3 = false;
    bg3cF = 0;
  }
}
