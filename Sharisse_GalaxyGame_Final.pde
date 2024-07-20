//--------------------------------------------------------------------//
// File name: Sharisse_GalaxyGame_V5                                  //
// Date: 2021-12-13   -   2022-01-14                                  //
// Programmers: Sharisse Ji                                           //
// Description: Final galaxy game, three lives, singleplayer          //
//--------------------------------------------------------------------//


//Audio Setup--------------------------------------
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

//VARIABLE NAMES
//audio variables
AudioPlayer startMusic;
AudioPlayer gameMusic;
AudioPlayer exitSound;
AudioSample bulletE;

// an array that holds the key input (LEFT and RIGHT arrow + SPACE)
boolean[] keys;                              
boolean triggerReleased = true;
int screen = 1;
boolean gameON = false;
boolean pauseMenu = false;
PFont mainFont;
boolean change = true;

//start menu background
boolean startBG=false;
int bg1numF = 25;
PImage[] bg1Images= new PImage [bg1numF];
int bg1cF=0;

//control menu background
boolean startBG2 =false;
int bg2numF = 4;
PImage[] bg2Images= new PImage [bg2numF];
int bg2cF = 1;

PImage controlmenu;

//game over background
boolean startBG3 =false;
int bg3numF = 12;
PImage[] bg3Images= new PImage [bg3numF];
int bg3cF = 0;

//scrolling background
PImage gameBG1;
PImage gameBG2;

int gameBG1X = 0;
int gameBG1Y = 0;
int gameBG1H;

int gameBG2X = 0;
int gameBG2Y = -gameBG1H;
int gameBG2H ;

int bgdSpeed = 2;

// ship variables
PImage ship1;
int shipW = 125;
int shipH = 150;
int shipX = 500;                             
int shipY = 750-shipH;                    
int shipSpeed = 5;

// ball variables
int ballW = 80;
int ballH = 100;
int ballSpeed = 4;

// add the three arrays for balls here
int[] ballX = new int[100];
int[] ballY = new int[100];
int[] ballSize = new int[100];
PImage[] asteroid = new PImage[100];
boolean[] ballVisible = new boolean[100];

// bullet variables
int bulletW = 5;                             
int bulletH = 25;                             
int bulletSpeed = 10;
int currentBullet = 0; 

//add the three arrays for bullets here
int[] bulletX = new int[100];
int[] bulletY = new int[100];
boolean[] bulletVisible = new boolean[100];

//bullet-asteroid collision explosion sprite
boolean e1Trigger=false;
int e1numF = 20;
PImage[] e1Images= new PImage [e1numF];
int e1cF=1;
int e1posX;
int e1posY;

//Explosion sprite
boolean e2Trigger = false;
int e2numF = 19;
PImage[] e2Images = new PImage [e2numF];
int e2cF = 0;
int e2posX;
int e2posY;

//Lives
int numlives = 3;
int score = 0;
PImage life1;
PImage life2;
PImage life3;
int highScore;

//POWERUP
int Ptimer = 500;
int wait_time = 1500;
boolean powerup = false;
boolean powerup2 = false;
int bulletD = 200;

///////////////////////////////////////////////
// Main Program                             //
/////////////////////////////////////////////

void setup() {
  size(1000, 750);
  background(0);
  smooth();
  noStroke();

  mainFont = createFont("INVASION2000.TTF", 100);
  PFont.list();
  
  loadStartBG();
  loadControlBG();
  loadEndBG();
  
  generateBalls();
  generateBullets(); 

  //-------------------------------------------//
  //LOADING IMAGES
  //loading sfx
  minim = new Minim(this);
  startMusic = minim.loadFile("startMusic.mp3");
  startMusic.setGain(-10);
  
  gameMusic = minim.loadFile("gameMusic.mp3");
  gameMusic.setGain(-10);
  
  bulletE = minim.loadSample("explosion_sound.mp3");
  bulletE.setGain(-15);
  
  exitSound = minim.loadFile("endingMusic.mp3");
 
  //loading backgroud images
  gameBG1 = loadImage("galaxybackground3.png"); 
  gameBG1.resize(width, height);
  gameBG2 = loadImage("galaxybackground3.png"); 
  gameBG2.resize(width, height);

  gameBG1H = gameBG1.height;
  gameBG2Y = -gameBG1H;
  gameBG2H = gameBG2.height;
  
  controlmenu = loadImage("controlmenu.png");
  controlmenu.resize(width,height);

  //loading ship images
  ship1 = loadImage("spaceship4.png");
  ship1.resize(shipW, shipH);

  //loading lives images
  life1 = loadImage("1heart.png");
  life1.resize(150, 50);
  life2 = loadImage("2hearts.png");
  life2.resize(150, 50);
  life3 = loadImage("3hearts.png");
  life3.resize(150, 50);

  loadExplosion1();
  loadExplosion2();

  //KEYS
  keys=new boolean[6];                     
  keys[0]=false;                           
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
  keys[5]=false;
}

//-------------------------------------------//
void draw() {
  frameRate(75);
  soundtrack();
  
  //SCREEN 1 (click to start) ||----------------------------------------------------------------------------------------
  if (screen == 1) { //click to start
    textAlign(CENTER, CENTER);
    textFont(mainFont);
    textSize(75);
    text("PRESS ANY KEY", width/2, height/2-50);
    text("TO START", width/2, height/2+50);
    if (keyPressed) {
      clear();
      screen = 2;
    }
  }
  //SCREEN 2 (start menu) ||--------------------------------------------------------------------------------------------
  if (screen == 2) { //start menu
    startBG = true;
    drawStartBG();
    startMenu();
    score = 0;
    numlives = 3;
  }
  //SCREEN 3 (ACTUAL GAME) ||-------------------------------------------------------------------------------------------
  if (screen == 3) {
    if (gameON == true) {
      background(0);
      redrawGameField(); 
      moveBackground();
      lives();
      score();

      moveShip();
      moveBalls();
      moveBullets();
      powerup();
      checkCollision();

      drawExplosion1(e1posX, e1posY);
      resetExplosion1();

      drawExplosion2(e2posX, e2posY);
      resetExplosion2();
    }
  }
  if(screen!= 3){ //respawning balls and ship when restarting game
    shipX = 500;                             
    shipY = height-shipH; 
    for (int i = 0; i <100; i ++) {
      ballY[i] = int(random(-8*height, 0));
    }
  }
  //SCREEN 4 (CONTROLS menu) ||-----------------------------------------------------------------------------------------
  if (screen == 4) { //controls menu
    startBG2 = true;
    drawControlBG();
    image(controlmenu, 0,0);
    EscapeButton();
  }

  //SCREEN 5 (if game over ENDSCREEN) ||--------------------------------------------------------------------------------
  if (screen == 5) { //game over if all lives lost
    clear();
    startBG3 = true;
    drawEndBG();
    endScreen();
  }
}

//-------------------------------------------//
void keyPressed() {
  // move the ship left / right with the arrow keys
  if (key==CODED && keyCode==RIGHT) keys[0]=true;
  if (key==CODED && keyCode==LEFT)  keys[1]=true;
  if (key==CODED && keyCode==UP)  keys[2]=true;
  if (key==CODED && keyCode==DOWN)  keys[3]=true;
  if (key==' ') keys[4]=true;// shoot bullets when SPACE BAR is pressed
  if(key == 'c') keys[5] = true; //powerup
}

void keyReleased() {
  if (key==CODED && keyCode==RIGHT) keys[0]=false;
  if (key==CODED && keyCode==LEFT) keys[1]=false;
  if (key==CODED && keyCode==UP)  keys[2]=false;
  if (key==CODED && keyCode==DOWN)  keys[3]=false;
  if (key==' ') keys[4]=false;
}
void mouseReleased() {
  change = true;
}
