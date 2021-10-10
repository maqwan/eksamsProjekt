class BallModel
{
  int x;
  int y;
  int size;
  
  boolean isBallAlive;

  boolean redBall;
  boolean blueBall;

  int colour;
  int ballType;
  int speed;

  BallModel()
  {
    x = int(random(0+(size/2), width)); // +(size/2) for at holde den inde for skærmen
    y = 0-(size/2); //for at starte den uden for skærmen
    size = int(random(20, 40));
    speed = int(random(2, 6));

    redBall = false;
    blueBall = false;

    isBallAlive = true;

    typeSelection();
  }

  void drawBall()
  {
    fill(colour);
    circle(x, y, size);
    noFill();
  }

  void moveBall()
  {
    y = y+speed;
  }
  void typeSelection()
  {
    int i = int(random(0, 11));

    if (i < 5) 
    {
      colour = #FC0320;
      ballType = i; // 
      redBall = true;
    } else
    {
      colour = #0A08FC;
      ballType = i; // 
      blueBall = true;
    }
  }
}
