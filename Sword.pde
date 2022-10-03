//REPRESENTS VISUAL ASPECT OF PUNCH ATTACK
class Sword
{
  float theta;
  float x, y;
  float size;
  public Sword(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    theta = 0;
  }

  //RENDERS SWORD SWING
  void render()
  {
    theta += .4;
    noStroke();
    fill(0);
    pushMatrix();
    translate(x, y);
    rotateX(theta);
    rotateZ(theta/2);
    rect(0, 0, 10, size);
    popMatrix();
  }
}
