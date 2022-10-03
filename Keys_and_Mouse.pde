//CHECKS ALL KEYS FOR GAME
void checkKeys()
{
  //PLAYER ONE
  //MOVEMENT
  if(keyDown('W') && !one.smashing)
  {
    one.jump();
    one.vert = 0;
    one.horiz = 2;
  }
  if(keyDown('A'))
  {
    one.x -= one.accel; 
    one.vert = 2;
    one.horiz = 0;
    if(one.accel < 10) 
    {
     one.accel += 3; 
    }
  }
  if(keyDown('S'))
  {
    one.y += 5;
    one.vert = 1;
    one.horiz = 2;
  }
  if(keyDown('D'))
  {
    one.x += one.accel; 
    one.vert = 2;
    one.horiz = 1;
    if(one.accel < 10) 
    {
     one.accel += 3; 
    }
  }
  if(keyDown('Q'))
  {
    one.emote();
  }
  
  //ATTACKS
  if(keyDown('Z') && one.canShoot)
  {
   one.projectiles.add(new Projectile(one.x,one.y,one.HORIZ_DISP[one.horiz],one.VERT_DISP[one.vert], 10, 25));
   one.canShoot = false;
  }
  if(keyDown('X') && one.canSlash)
  {
    one.slash(two);
  }
  if(keyDown('C') && one.canSmash)
  {
    one.smash();
  }
  
  //PLAYER TWO
  //MOVEMENT
  if(keyDown('I') && !two.smashing)
  {
    two.jump();
    two.vert = 0;
    two.horiz = 2;
  }
  if(keyDown('J'))
  {
    two.x -= two.accel; 
    two.vert = 2;
    two.horiz = 0;
    if(two.accel < 10) 
    {
     two.accel += 3; 
    }
  }
  if(keyDown('K'))
  {
    two.y += 5; 
    two.vert = 1;
    two.horiz = 2;
  }
  if(keyDown('L'))
  {
    two.x += two.accel; 
    two.vert = 2;
    two.horiz = 1;
    if(two.accel < 10) 
    {
     two.accel += 3; 
    }
  }
  if(keyDown('U'))
  {
    two.emote();
  }
  
  //ATTACKS
  if(keyDown('M') && two.canShoot)
  {
   two.projectiles.add(new Projectile(two.x,two.y,two.HORIZ_DISP[two.horiz],two.VERT_DISP[two.vert], 10, 25));
   two.canShoot = false;
  }
  if(keyDown(',') && two.canSlash)
  {
    two.slash(one);
  }
  if(keyDown('.') && two.canSmash)
  {
    two.smash();
  }  
}

//KEY METHODS
void keyPressed()
{
  if (keyCode >= 0 && keyCode < 256) 
  {
    keys[keyCode] = true;
  }
}
void keyReleased() 
{
  if (keyCode >= 0 && keyCode < 256) 
  {
    if(keyCode == 'A' || keyCode == 'D')
    {
      one.accel = 0;
    }
    if(keyCode == 'J' || keyCode == 'L')
    {
      two.accel = 0;
    }
    keys[keyCode] = false;
  }
}
boolean keyDown(int key) 
{
  return keys[key];
}
