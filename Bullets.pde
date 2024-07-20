void generateBullets() {
  for (int i = 0; i<100; i++) {
    //variable [index] allows to to grab that index from the array. This array as an integer index [100]
    //The first index is 0, one hundred is 99
    bulletX[i] =- 50;
    bulletY[i] =- 50;
    bulletVisible[i] = false;
  }
}

//-------------------------------------------//
void moveBullets() {
  if (keys[4] && triggerReleased) {         // triggerReleased is true when the SPACE bar is pressed
    triggerReleased = false;                // then it turns into false to prevent creating more then one bullet 
    bulletX[currentBullet] = shipX + shipW/2;        
    bulletY[currentBullet] = shipY;           
    bulletVisible[currentBullet] = true;   
    currentBullet++;
    if (currentBullet == 100) {
      currentBullet = 0;
    }
  } else if (keys[4]==false) {
    triggerReleased = true;
  }
  for (int i = 0; i<100; i++) {
    if (bulletVisible[i] == true) {
      bulletY[i] -= bulletSpeed;
      if (bulletY[i] <0) {
        bulletVisible[i] = false;
      }
    }
  }
}
