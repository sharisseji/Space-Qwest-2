void powerup() {
  textAlign(CENTER);
  rectMode(CENTER);
  textSize(25);
  noStroke();
  otherPowerup();

  if (wait_time <= 0) {
    powerup = true;
    fill(255);
    rect(150, 50, 250, 50);
    fill(0, 255, 0);
    text("POWER AVAIL", 150, 55);
  }
  if (keys[5]==true && gameON == true && powerup == true) {
    Ptimer -=1;
    if (Ptimer >= 0) {
      powerup2 = true;
      image(ship1, shipX+bulletD, shipY);

      fill(255);
      rect(175, 75, 250, 50);
      fill(255, 0, 0);
      text("TIME: "+nf(Ptimer, 3), 175, 80);

      wait_time = 1500;
    } else {
      powerup2 = false;
      powerup = false;
    }
  }
  if (powerup==false) {
    Ptimer = 500;
    wait_time -= 1;
    fill(255);
    rect(150, 50, 250, 50);
    fill(0);
    text("wait for power", 150, 55);
    keys[5] = false;
  }
}

//-------------------------------------------//
//collisions in powerup

void otherPowerup() {
  for (int i = 0; i <100; i++) {
    if (bulletVisible[i] == true) {
      fill(240, 190, 0);
      if (powerup2 == true) {
        rect(bulletX[i], bulletY[i], bulletW, bulletH);
        rect(bulletX[i]+bulletD, bulletY[i], bulletW, bulletH);
      } else if (powerup2 == false) {
        rect(bulletX[i], bulletY[i], bulletW, bulletH);
      }
    }
    if (powerup2 ==true) { //second ship collisions
    dist4 = distance(ballX[i], ballY[i], shipX+bulletD, shipY); //distance between spaceship 2 and asteroid
      if (ballVisible[i] == true && dist4 < ballSize[i]) {
        ballVisible[i] = false;

        e2posX = shipX+bulletD;
        e2posY = shipY;
        e2Trigger = true;
        powerup2 = false;
        powerup = false;
      }
    }
    for(int j = 0; j<100; j++){
      if (powerup2 ==true){
        dist3 = distance(ballX[i]+(ballSize[i]/2), ballY[i]+(ballSize[i]/2), bulletX[j]+bulletD, bulletY[j]);
        
        if (ballVisible[i]==true && bulletVisible[j]==true && dist3 < ballW) { //second ship bullet collisions
          ballVisible[i] = false; 
          bulletVisible[j] = false;
          score += 100;
          e1posX = ballX[i];
          e1posY = ballY[i];
          e1Trigger = true;
        }
      }
    }
  }
}
