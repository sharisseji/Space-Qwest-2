void generateBalls() {
  for (int i = 0; i < 100; i++) {
    ballX[i] = int(random(-30, width-80)); //x coordinate of the asteroid
    ballY[i] = int(random(-8*height, 0)); //y coordinate of the asteroid
    ballSize[i] = int(random(75,125)); //size of the asteroid is within certain range

    asteroid[i] = loadImage("asteroid1.png");
    asteroid[i].resize(ballSize[i]+30, ballSize[i]); //load and resize asteroid image
    ballVisible[i] = true;
  }
}

//-------------------------------------------//
void moveBalls() {
  for (int i = 0; i <100; i ++) {
    ballY[i] += ballSpeed; //increases y coordinate so asteroid moves down
    if (ballY[i] > height || ballVisible[i] ==false) {
      ballVisible[i] = true;
      ballY[i] = (-8*height); //moves ball 8 screens up if touches the bottom (respawns)
    }
  }
}
