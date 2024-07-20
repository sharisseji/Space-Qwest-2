void moveShip(){
  // move the ship with ARROWS KEYS
    if (keys[0] && shipX < width-shipW) { //RIGHT
      shipX = shipX + shipSpeed;
    }

    if (keys[1] && shipX > 0) { //LEFT
      shipX = shipX - shipSpeed;
    }
    
    if(keys[2] && shipY > 0){ //UP
      shipY = shipY - shipSpeed;
    }
    if(keys[3] && shipY < height-shipH){ //DOWN
      shipY = shipY + shipSpeed;
    }
}
