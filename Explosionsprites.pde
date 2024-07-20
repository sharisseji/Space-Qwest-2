//BULLET-ASTEROID COLLISION EXPLOSIONS
void  loadExplosion1() {//Identifying my sprite
  for (int i=1; i< e1numF; i++) {
    e1Images[i] = loadImage ("explode"+str(i)+".png"); 
    e1Images[i].resize(150, 100);
  }
}

//Explosion Function
void drawExplosion1 (int posX1, int posY2) {
  if (e1Trigger == true) {
    image (e1Images[e1cF], posX1, posY2);
    e1cF++;
    if (e1cF >= 20) {
      e1Trigger = false;
    }
  }
}

//Resets sprite sequence
void resetExplosion1 () {
  if (e1Trigger==false) {
    e1cF = 1;
  }
}


//-------------------------------------------//
//ASTEROID-SHIP COLLISION EXPLOSIONS
void  loadExplosion2() {//Identifying my sprite
  for (int i=0; i< e2numF; i++) {
    e2Images[i] = loadImage ("frame_"+str(i)+"_delay-0.06s.gif"); 
    e2Images[i].resize(100, 100);
  }
}

//Explosion Function
void drawExplosion2 (int posX1, int posY2) {
  if (e2Trigger == true) {
    image (e2Images[e2cF], posX1, posY2);
    e2cF++;
    if (e2cF >= 19) {
      e2Trigger = false;
    }
  }
}

//Resets sprite sequence
void resetExplosion2 () {
  if (e2Trigger==false) {
    e2cF = 0;
  }
}
