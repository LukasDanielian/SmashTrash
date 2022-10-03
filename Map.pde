class Map
{
  Platform floor, left, right, top;
  Icon icon;

  public Map(Platform floor, Platform left, Platform right, Platform top, String mapName, int num)
  {
    this.floor = floor;
    this.left = left;
    this.right = right;
    this.top = top;

    //FIRST ROW
    if(num < 8)
    {
      icon = new Icon(width/16 + width/8 * num, height * .6, 150, 150, mapName, (num%8)*255/8);
    }
    //SECOND ROW
    else
    {
      icon = new Icon(width/16 + width/8 * (num % 8), height * .82, 150, 150, mapName, (num%8)*255/8);
    }
  }

  void render()
  {
    floor.render();
    left.render();
    right.render();
    top.render();
  }

  void renderIcon()
  {
    icon.render();
  }
}
