//RENDERS ALL PROJECTILES
void renderProjectiles()
{
  //PLAYER ONE
  for (int i=0; i<one.projectiles.size(); i++)
  {
    Projectile temp = one.projectiles.get(i);
    temp.render();
    if (temp.didHit(two) || temp.outOfBounds())
    {
      if (temp.didHit(two))
      {
        if (temp.x>two.x)
          two.knockBack(-1, 15);
        else
          two.knockBack(1, 15);
      }
      one.projectiles.remove(i);
      i--;
    }
  }

  //PLAYER TWO
  for (int i=0; i<two.projectiles.size(); i++)
  {
    Projectile temp = two.projectiles.get(i);
    temp.render();
    if (temp.didHit(one) || temp.outOfBounds())
    {
      if (temp.didHit(one))
      {
        if (temp.x>one.x)
          one.knockBack(-1, 15);
        else
          one.knockBack(1, 15);
      }

      two.projectiles.remove(i);
      i--;
    }
  }
}

//RENDERS ON SCREEN EFFECTS
void renderHUD()
{
  rectMode(CORNER);
  //PLAYER ONE
  noStroke();
  fill(map(one.health, 100, 0, 175, 255), map(one.health, 100, 50, 255, 0), 0);
  rect(0, 0, one.health*2, 25);

  noFill();
  stroke(0);
  strokeWeight(5);
  rect(0, 0, 200, 25);

  //PLAYER TWO
  noStroke();
  fill(map(two.health, 100, 0, 175, 255), map(two.health, 100, 50, 255, 0), 0);
  rect(width-200, 0, two.health*2, 25);

  noFill();
  stroke(0);
  strokeWeight(5);
  rect(width-200, 0, 200, 25);

  rectMode(CENTER);
  fill(0);
  rect(width/2, height * .05, width * .15, height * .1);
  fill(255);
  textSize(50);
  text("Time Left: " + int((timer/FPS)), width/2, height * .05);

  if (timer < 6 * FPS)
  {
    textSize(400);
    fill(255, 0, 0);
    text(int((timer/FPS)), width/2, height/2.5);
  }
  rectMode(CORNER);
}

//MAP OPTIONS RENDER
void renderMapIcons()
{
  for (int i = 0; i < maps.size(); i++)
  {
    maps.get(i).renderIcon();

    if (maps.get(i).icon.isClicked())
    {
      map = i;
    }
  }
}
