//VARIABLES
ArrayList<Map> maps;
int map;
boolean[] keys = new boolean[256];
Player one, two;
boolean gameOver;
String winner;
boolean mainMenu;
int timer;
int FPS = 60;
int logoCol;
int deathTime;

void setup()
{
  //SETTINGS
  fullScreen(P3D);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  frameRate(FPS);

  //VARIABLE DECLARATION
  maps = new ArrayList<Map>();
  makeMaps();
  map = -1;

  one = new Player(width * .25, height * .6, #FF0000);
  two = new Player(width * .75, height * .6, #0000FF);

  gameOver = false;
  winner = "";
  mainMenu = true;
  timer = 0;
  deathTime = 0;
  logoCol = (int)random(0, 255);
}

void draw()
{
  background(255);
  
  rectMode(CENTER);
  hint(DISABLE_DEPTH_TEST);

  //MAIN MENU
  if (mainMenu)
  {
    textSize(150);
    colorMode(HSB);
    logoCol += 1;
    fill(logoCol % 255, 255, 255);
    colorMode(RGB);
    text("SMASH TRASH", width/2, height * .1);
    textSize(50);
    fill(255);
    text("Select Map", width/2, height * .4);
    renderMapIcons();

    if (map != -1)
    {
      timer = int(90 * FPS);
      mainMenu = false;
    }
  }

  //MAIN GAME
  else if (!gameOver)
  {
    timer--;
    if (timer <= 0)
    {
      if (one.health > two.health)
        winner = "Red Wins!";
      else if (two.health > one.health)
        winner = "Blue Wins!";
      else
        winner = "Tie";
      gameOver = true;
    }
    
    //BACKGROUND 
    renderHUD();
    lights();
    rotateX(-PI/10);

    //PLATFORMS
    maps.get(map).left.render();
    maps.get(map).right.render();
    maps.get(map).top.render();
    maps.get(map).floor.render();

    //PLAYERS
    one.render();
    two.render();

    checkKeys();
    checkCollision();

    //PROJECTILES
    renderProjectiles();
    checkGameOver();
    
  }

  //GAME OVER SCREEN
  else
  {
    textSize(150);
    if (winner.equals("Red Wins!"))
    {
      fill(one.col);
    } else if (winner.equals("Blue Wins!"))
    {
      fill(two.col);
    } else
    {
      fill(255);
    }
    text(winner + "\nRestart: R", width/2, height/2);

    //RESTART
    if (keyDown('R'))
    {
      setup();
    }
  }
}
