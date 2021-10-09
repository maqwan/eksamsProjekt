class KeeperModel
{
  int x;
  int y;
  int size;
  int speed;
  int colour;
  int superPowerColour;
  int superPowerSize;
  boolean IsPowerActive;
  boolean boolRight;
  boolean boolLeft;

  KeeperModel(int tempColour)
  {
    size = height/20;
    x = height/2;
    y = height-(size*3);// to keep it a bit above ground

    speed = 5;
    colour = tempColour;
    superPowerColour = #FFEE55;
    superPowerSize = size*2;
    boolRight = false;
    boolLeft = false;
    IsPowerActive = false;
  }

  void drawKeeper()
  {
    if (IsPowerActive == true)
    {
      fill(superPowerColour);
      circle(x, y, superPowerSize);
      noFill();
      stroke(1);
    } 
    else if (IsPowerActive == false)
    {
      fill(colour);
      circle(x, y, size);
      noFill();
    }
  }
  void moveKeeper()
  {
    if (boolRight == true)
    {
      moveRight();
    }
    if (boolLeft == true)
    {
      moveLeft();
    }
  }
  void moveRight()
  {
    x = x+speed;
  }

  void moveLeft()
  {
    x = x-speed;
  }
}
