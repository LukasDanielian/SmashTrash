//CHECKS ALL COLLISIONS OF PLATFORMS AND PLAYERS
void checkCollision()
{
  Map temp = maps.get(map);
  Platform floor = temp.floor;
  Platform left = temp.left;
  Platform right = temp.right;
  Platform top = temp.top;
  //PLAYER ONE
  //FLOOR
  if (collide(one.x - 25, one.y - 25, 50, 50, floor.x - floor.w/2, floor.y-floor.h/2, floor.w, floor.h))
  {
    float[] loc = pushOut(one.x-25, one.y-25, one.px-25, one.py-25, 50, 50, floor.x-floor.w/2, floor.y-floor.h/2, floor.x-floor.w/2, floor.y-floor.h/2, floor.w, floor.h);
    one.x = loc[0] + 25;
    one.y = loc[1] + 25;
    one.jumps = 2;

    //SMASHING EFFECT
    if (one.smashing)
    {
      noStroke();
      fill(#FF6700);
      circle(one.x, one.y, one.size * 3);
      if (dist(one.x, one.y, two.x, two.y) <= one.size * 3)
      {
        two.health -= 20;
        if (one.x>two.x)
          two.knockBack(-1, 20);
        else
          two.knockBack(1, 20);
      }
      one.smashing = false;
      one.yMover = 10;
    }
  }

  if (!keyDown('S'))
  {
    //LEFT
    if (!one.smashing && one.yMover > 0 && collide(one.x - 25, one.y - 25, 50, 50, left.x - left.w/2, left.y-left.h/2, left.w, left.h))
    {
      float[] loc = pushOut(one.x-25, one.y-25, one.px-25, one.py-25, 50, 50, left.x-left.w/2, left.y-left.h/2, left.x-left.w/2, left.y-left.h/2, left.w, left.h);
      one.x = loc[0] + 25;
      one.y = loc[1] + 25;
      one.xMover = 0;
      one.yMover = 10;
      one.jumps = 3;
    }
    //RIGHT
    if (!one.smashing && one.yMover > 0 && collide(one.x - 25, one.y - 25, 50, 50, right.x - right.w/2, right.y-right.h/2, right.w, right.h))
    {
      float[] loc = pushOut(one.x-25, one.y-25, one.px-25, one.py-25, 50, 50, right.x-right.w/2, right.y-right.h/2, right.x-right.w/2, right.y-right.h/2, right.w, right.h);
      one.x = loc[0] + 25;
      one.y = loc[1] + 25;
      one.xMover = 0;
      one.yMover = 10;
      one.jumps = 3;
    }
    //TOP
    if (!one.smashing && one.yMover > 0 && collide(one.x - 25, one.y - 25, 50, 50, top.x - top.w/2, top.y-top.h/2, top.w, top.h))
    {
      float[] loc = pushOut(one.x-25, one.y-25, one.px-25, one.py-25, 50, 50, top.x-top.w/2, top.y-top.h/2, top.x-top.w/2, top.y-top.h/2, top.w, top.h);
      one.x = loc[0] + 25;
      one.y = loc[1] + 25;
      one.xMover = 0;
      one.yMover = 10;
      one.jumps = 3;
    }
  }


  //PLAYER TWO
  //FLOOR
  if (collide(two.x - 25, two.y - 25, 50, 50, floor.x - floor.w/2, floor.y-floor.h/2, floor.w, floor.h))
  {
    float[] loc = pushOut(two.x-25, two.y-25, two.px-25, two.py-25, 50, 50, floor.x-floor.w/2, floor.y-floor.h/2, floor.x-floor.w/2, floor.y-floor.h/2, floor.w, floor.h);
    two.x = loc[0] + 25;
    two.y = loc[1] + 25;
    two.jumps = 2;

    //SMASHING EFFECT
    if (two.smashing)
    {
      noStroke();
      fill(#FF6700);
      circle(two.x, two.y, two.size * 3);
      if (dist(two.x, two.y, one.x, one.y) <= two.size * 3)
      {
        one.health -= 20;
        if (two.x>one.x)
          one.knockBack(-1, 20);
        else
          one.knockBack(1, 20);
      }
      two.smashing = false;
      two.xMover = 0;
      two.yMover = 10;
    }
  }

  if (!keyDown('K'))
  {
    //LEFT
    if (!two.smashing && two.yMover > 0 && collide(two.x - 25, two.y - 25, 50, 50, left.x - left.w/2, left.y-left.h/2, left.w, left.h))
    {
      float[] loc = pushOut(two.x-25, two.y-25, two.px-25, two.py-25, 50, 50, left.x-left.w/2, left.y-left.h/2, left.x-left.w/2, left.y-left.h/2, left.w, left.h);
      two.x = loc[0] + 25;
      two.y = loc[1] + 25;
      two.xMover = 0;
      two.yMover = 10;
      two.jumps = 3;
    }
    //RIGHT
    if (!two.smashing && two.yMover > 0 && collide(two.x - 25, two.y - 25, 50, 50, right.x - right.w/2, right.y-right.h/2, right.w, right.h))
    {
      float[] loc = pushOut(two.x-25, two.y-25, two.px-25, two.py-25, 50, 50, right.x-right.w/2, right.y-right.h/2, right.x-right.w/2, right.y-right.h/2, right.w, right.h);
      two.x = loc[0] + 25;
      two.y = loc[1] + 25;
      two.xMover = 0;
      two.yMover = 10;
      two.jumps = 3;
    }
    //TOP
    if (!two.smashing && two.yMover > 0 && collide(two.x - 25, two.y - 25, 50, 50, top.x - top.w/2, top.y-top.h/2, top.w, top.h))
    {
      float[] loc = pushOut(two.x-25, two.y-25, two.px-25, two.py-25, 50, 50, top.x-top.w/2, top.y-top.h/2, top.x-top.w/2, top.y-top.h/2, top.w, top.h);
      two.x = loc[0] + 25;
      two.y = loc[1] + 25;
      two.xMover = 0;
      two.yMover = 10;
      two.jumps = 3;
    }
  }
}

//CHECKS IF GAME IS OVER
void checkGameOver()
{
  int num = 0;
  if (one.y > height || one.health <= 0)
  {
    gameOver = true;
    winner = "Blue Wins!";
    num++;
  }

  if (two.y > height || two.health <= 0)
  {
    gameOver = true;
    winner = "Red Wins!";
    num++;
  }

  if (num == 2)
  {
    winner = "Tie!";
  }
}

//MAKES ALL MAP OPTIONS
void makeMaps()
{
  Platform floor, left, right, top;
  //DEFAULT
  floor = new Platform(width/2, height*.75, width*.7, height*.1);
  left = new Platform(width*.3, height/2, width*.15, height*.02);
  right = new Platform(width*.70, height/2, width*.15, height*.02);
  top = new Platform(width/2, height*.3, width*.15, height*.02);
  maps.add(new Map(floor, left, right, top, "Default", 0));

  //FINAL POINT
  floor = new Platform(width/2, height*.75, width*.7, height*.1);//X POS, Y POS, WIDTH, HEIGHT
  left = new Platform(width*3, height/2, width*.15, height*.02);//X POS, Y POS, WIDTH, HEIGHT
  right = new Platform(width*70, height/2, width*.15, height*.02);//X POS, Y POS, WIDTH, HEIGHT
  top = new Platform(width*2, height*.3, width*.15, height*.02);//X POS, Y POS, WIDTH, HEIGHT
  maps.add(new Map(floor, left, right, top, "Final Point", 1));//FLOOR, LEFT, RIGHT, TOP, NAME, NUMBER

  //STAR BATTLE
  floor = new Platform(width/2, height/2, width*.5, height*.1);
  left = new Platform(width*.3, height*.75, width*.15, height*.02);
  right = new Platform(width*.70, height*.75, width*.15, height*.02);
  top = new Platform(width/2, height*.3, width*.15, height*.02);
  maps.add(new Map(floor, left, right, top, "Star Battle", 2));

  //ABOMIDABLE
  floor = new Platform(width/2, height*.75, width*.075, height*.1);
  left = new Platform(width*.25, height*.75, width*.10, height*.02);
  right = new Platform(width*.75, height*.75, width*.10, height*.02);
  top = new Platform(width/2, height*.45, width*.15, height*.02);
  maps.add(new Map(floor, left, right, top, "Abomidable", 3));

  //ROUTE ONE
  floor = new Platform(width/2, height*.75, width*4, height*.1);
  left = new Platform(width*.1, height*.4, width*.15, height*.02);
  right = new Platform(width*.9, height*.4, width*.15, height*.02);
  top = new Platform(width/2, height * 2, width*.15, height*.02);
  maps.add(new Map(floor, left, right, top, "Route One", 4));

  //DA FAULT
  floor = new Platform(width/2, height*.75, width*.7, height*.1);
  left = new Platform(width*.3, height*.3, width*.15, height*.02);
  right = new Platform(width*.70, height*.3, width*.15, height*.02);
  top = new Platform(width/2, height/2, width*.15, height*.02);
  maps.add(new Map(floor, left, right, top, "Da Fault", 5));

  //STEPPING UP
  floor = new Platform(width/2, height*.75, width*.7, height*.1);
  left = new Platform(width*.3, height*.55, width*.7, height*.02);
  right = new Platform(width*.70, height*.35, width*.7, height*.02);
  top = new Platform(width/2, height*.15, width*.7, height*.02);
  maps.add(new Map(floor, left, right, top, "Stepping Up", 6));

  //KONGO DESCENDS
  floor = new Platform(width/2, height*.75, width*.7, height*.1);
  left = new Platform(width/2, height*.55, width*.5, height*.02);
  right = new Platform(width/2, height*.35, width*.3, height*.02);
  top = new Platform(width/2, height*.15, width*.1, height*.02);
  maps.add(new Map(floor, left, right, top, "Kongo Descends", 7));

  //FLAT ZONE Y
  floor = new Platform(width/2, height*.75, width, height*.1);
  left = new Platform(0, height*.55, width*.25, height*.02);
  right = new Platform(0, height*.35, width*.25, height*.02);
  top = new Platform(0, height*.15, width*.25, height*.02);
  maps.add(new Map(floor, left, right, top, "Flat Zone Y", 8));

  //TRUST JUMP
  floor = new Platform(width/2, height*.75, width*.5, height*.1);
  left = new Platform(width*.15, height/2, width*.15, height*.02);
  right = new Platform(width*.85, height/2, width*.15, height*.02);
  top = new Platform(width/2, height*.3, width*.15, height*.02);
  maps.add(new Map(floor, left, right, top, "Trust Jump", 9));
}

//MATH
float mod(float a, float b) {
  if (a%b < 0) {
    return a%b+b;
  }
  return a%b;
}
