// distance between the current bullet and ball
int dist1; //distance between current bullet and asteroid
int dist2; //distance between asteroid and ship
int dist3; //find in powerup: second ship bullet collisions
int dist4; //find in powerup: distance between spaceship 2 and asteroid

// a function that calculates and returns the distance between two points as a decimal number
int distance (int x1, int y1, int x2, int y2) { //first coordinate and second coordinate
  return round(sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2))); //calculates distance using slope formula
}

//-------------------------------------------//
void checkCollision() {
  for (int i = 0; i<100; i++) {
    for (int j = 0; j<100; j++) {

      // check for collision between the visible bullets and visible balls using the distance function
      dist1 = distance(ballX[i]+(ballSize[i]/2), ballY[i]+(ballSize[i]/2), bulletX[j]+(bulletW), bulletY[j]+(bulletH));

      if (ballVisible[i]==true && ballY[i] >= 10 && bulletVisible[j]==true && dist1 < ballW) {
        //sound effect
        bulletE.trigger();
        
        ballVisible[i] = false; 
        bulletVisible[j] = false;
        score += 50;

        //explosion animations
        e1posX = ballX[i];
        e1posY = ballY[i];
        e1Trigger = true;
      }
      //-------------------------------------------//
      //check for collision between asteroids and ship
      dist2 = distance(ballX[i], ballY[i], shipX, shipY);

      if (ballVisible[i] == true && dist2< ballSize[i]) {
        ballVisible[i] = false;
        numlives--;
        
        //explosion animations
        e2posX = shipX;
        e2posY = shipY;
        e2Trigger = true;
      }
    }
  }
}

void lives() {
  if (numlives == 3) {
    image(life3, width-160, 10);
  } else if (numlives == 2) {
    image(life2, width-160, 10);
  } else if (numlives ==1) {
    image(life1, width-160, 10);
  } else if (numlives == 0) {
    //go to next state (GAME OVER state)
    gameON = false;
    screen = 5;
  }
}
