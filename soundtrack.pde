void soundtrack(){
  if(screen != 3 ){
    gameMusic.pause();
    if (!startMusic.isPlaying()) {
        startMusic.rewind();
        startMusic.play();
      }
  }
  if(screen == 3){
    startMusic.pause();
    if (!gameMusic.isPlaying()) {
        gameMusic.rewind();
        gameMusic.play();
      }
  }
}
