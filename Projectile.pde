//REPRESENTS A PROJECTILE
class Projectile
{
  float x,y,xMover,yMover, damage, size, hue;
  
  public Projectile(float x, float y, float xMover, float yMover, float damage, float size)
  {
    this.x = x;
    this.y = y;
    this.xMover = xMover;
    this.yMover = yMover;
    this.damage = damage;
    this.size = size;
    hue = random(0,255);
  }
  
  //RENDERS ONE PROJECTILE
  void render()
  {
    noStroke();
    colorMode(HSB);
    fill(hue % 255,255,255);
    colorMode(RGB);
    
    pushMatrix();
    translate(x,y);
    sphere(size/2); 
    popMatrix();
    
    x += xMover;
    y += yMover;
    hue += 10;
  }
  
  //CHECKS COLLISION
  boolean didHit(Player player)
  {
    if(dist(x,y,player.x,player.y) <= size/2 + player.size/2)
    {
      player.health -= 5;
      return true;
    }
    return false;
  }
  
  //CHECKS IF IN BOUNDS
  boolean outOfBounds()
  {
    if(x < 0 || x > width || y < 0 || y > height)
    {
     return true; 
    }
    return false;
  }
}
