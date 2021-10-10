class KeeperModel
{
  int x;
  int y;
  int size;

  int colour;

  boolean blueKeeper;
  boolean redKeeper;
  boolean isAlive;
  
  KeeperModel()
  {
    size = height/20;
    x = mouseX;
    y = mouseY;

    isAlive = true;
    blueKeeper = false;
    redKeeper = false;

    colour = keeperColour();
  }
  KeeperModel(boolean tempRed, boolean tempBlue)
  {
    size = height/20;
    x = mouseX;
    y = mouseY;

    isAlive = true;

    blueKeeper = tempBlue;
    redKeeper = tempRed;
    
    colour = keeperColour();
  }

  void drawKeeper()
  {
    if(isAlive == true)
    {
    fill(colour);
    x = mouseX;
    y = mouseY;
    circle(x,y,size);
    }
    else
    {
      println("u dead bro");
    }
  }

  int keeperColour()
  {
    if (blueKeeper == true)
    {
      colour = #0A08FC;
    } 
    else if (redKeeper == true)
    {
      colour = #FC0320;
    }

    return colour;
  }
}
