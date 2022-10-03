//REPRESENTS ONE PLAYER
class Player
{
  ArrayList<Projectile> projectiles;
  ArrayList<Ball> balls;
  float x, y, px, py, size;
  float xMover, yMover;
  int col, health;
  int jumps;
  float accel;

  boolean jumping;
  boolean smashing;
  boolean slashing;
  boolean slingShotting;
  boolean emoting;
  boolean canShoot;
  boolean canSmash;
  boolean canSlash;
  boolean canEmote;
  boolean knockBack;

  int shootCooldown;
  int smashCooldown;
  int slashCooldown;
  int emoteTime;

  Icon shoot;
  Icon smash;
  Icon slash;

  Sword sword;

  int vert = 0;
  int horiz = 2;
  final float[] VERT_DISP = {-20, 20, 0};
  final float[] HORIZ_DISP = {-20, 20, 0};

  public Player(float x, float y, int col)
  {
    this.x = x;
    this.y = y;
    this.col = col;

    xMover = 0;
    yMover = 10;
    size = 50;
    jumps = 2;
    health = 100;
    accel = 0;

    canShoot = true;
    canSmash = true;
    canSlash = true;
    jumping = false;
    smashing = false;
    slashing = false;
    slingShotting = false;
    knockBack = false;

    shootCooldown = int(25.0/60*FPS);
    smashCooldown = int(100.0/60*FPS);
    slashCooldown = int(150.0/60*FPS);
    emoteTime = 200;

    projectiles = new ArrayList<Projectile>();
    balls = new ArrayList<Ball>();
    
    //COOLDOWN ICONS
    //PLAYER ONE
    if (x < width/2)
    {
      shoot = new Icon(x - 100, height * .85, "Shoot");
      smash = new Icon(x + 100, height * .85, "Smash");
      slash = new Icon(x, height * .85, "Slash");
    }
    //PLAYER TWO
    else
    {
      shoot = new Icon(x - 100, height * .95, "Shoot");
      smash = new Icon(x + 100, height * .95, "Smash");
      slash = new Icon(x, height * .95, "Slash");
    }
  }

  //RENDERS ONE PLAYER
  void render()
  {
    //ICON RENDER
    shoot.render(canShoot, shootCooldown);
    smash.render(canSmash, smashCooldown);
    slash.render(canSlash, slashCooldown);
    shoot.x = x-100;
    smash.x = x+100;
    slash.x = x;

    //JUMPING EFFECT
    if (jumping)
    {
      if (yMover < 10)
      {
        yMover++;
      } else
      {
        jumping = false;
      }
    }

    //PUNCHING EFFECT
    if (slashing)
    {
      sword.x = x;
      sword.y = y;
      sword.render();

      if (sword.theta > 15)
      {
        slashing = false;
      }
    }

    //SLING SHOT EFFECT
    if (slingShotting)
    {
      if (yMover < 10)
      {
        yMover+=5;
      } else
      {
        slingShotting = false;
      }
    }

    //KNOCK BACK
    if (knockBack)
    {
      if (xMover<0)
      {
        xMover++;
      } else if (xMover>0)
      {
        xMover--;
      } else
      {
        knockBack = false;
      }
    }
    
    //EMOTE EFFECT
    if(emoting)
    {
      if(balls.size() < 30)
      {
        balls.add(new Ball(x,y,col));
      }
      
      for(int i = 0; i < balls.size(); i++)
      {
        balls.get(i).render();
        
        if(balls.get(i).size <= 0)
        {
          balls.remove(i);
          i--;
        }
      }
      
      if(emoteTime <= 0)
      {
        emoting = false;
        emoteTime = 200;
        balls.clear();
      }
    }

    //COOLDOWNS
    if (!canShoot)
    {
      shootCooldown--;
    }
    if (!canSmash)
    {
      smashCooldown--;
    }
    if (!canSlash)
    {
      slashCooldown--;
    }
    if(emoting)
    {
      emoteTime--;
    }

    //RELOADS
    if (shootCooldown == 0)
    {
      canShoot = true;
      shootCooldown = int(25.0/60*FPS);
    }
    if (smashCooldown == 0)
    {
      canSmash = true;
      smashCooldown = int(100.0/60*FPS);
    }
    if (slashCooldown == 0)
    {
      canSlash = true;
      slashCooldown = int(150.0/60*FPS);
    }

    //PLAYER AND MOVEMENT
    px = x;
    py = y;
    noStroke();
    fill(col);
    pushMatrix();
    translate(x, y);
    sphere(size/2);
    popMatrix();
    y += yMover;
    x += xMover;

    noStroke();
    if (y < 0)
    {
      triangle(x, height * .01, x - 25, height * .05, x + 25, height * .05);
    } else if (x < 0)
    {
      triangle(width * .01, y, width * .05, y - 25, width * .05, y + 25);
    } else if (x > width)
    {
      triangle(width * .99, y, width * .95, y - 25, width * .95, y + 25);
    }
  }

  //STARTS JUMPING ANIMATION
  void jump()
  {
    if (!jumping && jumps > 1)
    {
      yMover = -20;
      xMover = 0;
      jumping = true;
      jumps--;
    }
  }

  //STARTS SMASH ANIMATION
  void smash()
  {
    yMover = 30;
    canSmash = false;
    smashing = true;
  }

  //STARTS PUNCH ANIMATION
  void slash(Player player)
  {
    sword = new Sword(x, y, 125);

    if (dist(x, y, player.x, player.y) <= sword.size)
    {
      player.health -= 15;
      player.slingShot();
    }
    canSlash = false;
    slashing = true;
  }

  //SLINGSHOTS PLAYER
  void slingShot()
  {
    yMover = -100;
    xMover = random(-10, 10);

    while (abs(xMover) < 5)
    {
      xMover = random(-10, 10);
    }

    slingShotting = true;
  }

  //CALCULATES KNOCKBACK ON PLAYER
  void knockBack(int dir, float vel)
  {
    if (dir != 0)
    {
      xMover = vel*dir;
      knockBack = true;
    }
  }
  
  //STARTS EMOTE
  void emote()
  {
    emoting  = true;
  }
}
