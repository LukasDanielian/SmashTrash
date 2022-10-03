//COLLISION
boolean collide(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) 
{
  if (x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}
boolean collide1D(float x1, float w1, float x2, float w2) 
{
  return x1 < x2 + w2 && x1 + w1 > x2;
}
float[] pushOut(float x1, float y1, float px1, float py1, float w1, float h1, float x2, float y2, float px2, float py2, float w2, float h2) 
{
  float x = x1;
  float y = y1;
  if (y1 >= y2 && y1 + h1 >= y2 + h2 && collide1D(px1, w1, px2, w2)) 
  {
    y = y1 + abs(y1 - (y2 + h2));
  } 
  else if (y1 + h1 >= y2 && y1 <= y2 && collide1D(px1, w1, px2, w2)) 
  {
    y = y1 - abs(y2 - (y1+h1));
  } 
  else if (x1 >= x2 && x1 + w1 >= x2 + w2 && collide1D(py1, h1, py2, h2)) 
  {
    x = x1 + abs((x2 + w2) - x1);
  } 
  else if (x1 + w1 <= x2 + w2 && x1 <= x2 && collide1D(py1, h1, py2, h2)) 
  {
    x = x1 - abs(x2 - (x1 + w1));
  } 
  else if (y1 + h1 >= y2 + h2 && y1 <= y2 + h2) 
  {
    y = y1 + abs(y1 - (y2 + h2));
  } 
  else if (y1 + h1 >= y2 && y1 <= y2) 
  {
    y = y1 - abs(y2 - (y1+h1));
  } 
  else if (x1  <= x2 + w2 && x1 + w1 >= x2 + w2) 
  {
    x = x1 + abs((x2 + w2) - x1);
  } 
  else if (x1 <= x2  && x1 + w1 >= x2) 
  {
    x = x1 - abs(x2 - (x1 + w1));
  }
  float[] i  = {x, y};
  return i;
}
