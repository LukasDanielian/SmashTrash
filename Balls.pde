//EMOTE CLASS
class Ball
{
  float x , y, xMover, yMover, size;
  int col;
  
  public Ball(float x, float y, int col)
  {
   this.x = x;
   this.y = y;
   this.col = col;
   xMover = random(-3,3);
   yMover = random(-3,3);
   size = random(5,15);
  }
  
  //RENDERS EMOTE ANIMATION
  void render()
  {
    pushMatrix();
    fill(col);
    noStroke();
    translate(x,y);
    sphere(size);
    popMatrix();
    
    x += xMover;
    y += yMover;
    size -= .1;
  }
}
