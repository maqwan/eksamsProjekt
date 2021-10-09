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
    size = int(random(10, 30));
    speed = int(random(1, 6));
    
    redBall = false;
    blueBall = false;
    
    isBallAlive = true;
    
    typeSelection();
  }
  
  void sendOutOfBound()
  {
  x = height*height;
  y = height*height;
  
  }

  void drawBall()
  {
    fill(colour);
    circle(x,y,size);
    noFill();
  }

  void moveBall()
  {
    y = y+speed;
  }
  void typeSelection()
  {
    int i = int(random(0, 3));
    
    if (i == 1) 
    {
      colour = #FF1A1A;
      ballType = i; // rød bold der skal reddes
      redBall = true;   
    } 
    else
    {
      colour = #0248B7;
      ballType = i; // blå skal reddes med "superKraft
      blueBall = true;
    }
  }

}
