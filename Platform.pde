//REPRESENTS ONE PLATFORM
class Platform
{
  float x, y, w, h;
  float hue;

  public Platform(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hue = random(0,255);
  }

  //RENDERS ONE PLATFORM
  void render()
  {
    colorMode(HSB);
    hint(ENABLE_DEPTH_TEST);
    //PLATFORM
    stroke(hue % 255, 255, 255);
    strokeWeight(5);
    fill(100);
    pushMatrix();
    translate(x,y);
    box(w, h, 150);
    popMatrix();
    colorMode(RGB);
    
    hue += 4;
  }
}
