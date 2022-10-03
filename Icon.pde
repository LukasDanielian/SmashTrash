//REPRESENDS ABILITY ICONS
class Icon
{
  float x, y, w, h;
  String text;
  float hue;
  
  public Icon(float x, float y, String text)
  {
    this.x = x;
    this.y = y;
    this.text = text;

    w = 100;
    h = 50;
  }

  public Icon(float x, float y, float w, float h, String text, float hue)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.hue = hue;
  }

  //RENDERS ICON COOLDOWN
  void render(boolean canUse, int timeLeft)
  {
    rectMode(CENTER);
    pushMatrix();
    rotateX(PI/10);
    hint(ENABLE_DEPTH_TEST);
    stroke(255);
    strokeWeight(5);
    fill(0);
    rect(x, y, w, h, 50);
    textSize(20);
    hint(DISABLE_DEPTH_TEST);
    if (canUse)
    {
      fill(255);
      text(text, x, y);
    } else
    {
      fill(255, 0, 0);
      text(text + " " + timeLeft, x, y);
    }
    popMatrix();
  }

  //RENDERS ICON CLICKABLE
  void render()
  {
    colorMode(HSB);
    hue-=.5;
    stroke(mod(hue, 255), 255, 180);
    strokeWeight(5);
    fill(mod(hue, 255), 255, 255);
    rect(x, y, w, h, 50);
    textSize(20);
    fill(0);
    text(text, x, y);
    colorMode(RGB);
  }

  //CHECKS IF ICON IS CLICKED
  boolean isClicked()
  {
    if (mousePressed && mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y  - h/2 && mouseY < y + h/2)
    {
      return true;
    }
      return false;
  }
}
