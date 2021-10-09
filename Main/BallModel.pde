class BallModel
{
  int x;
  int y;
  int size;
  boolean ballAlive;
  int colour;
  int ballType;
  int speed;

  BallModel()
  {
    x = int(random(0+(size/2), width)); // +(size/2) for at holde den inde for skærmen
    y = 0-(size/2); //for at starte den uden for skærmen
    size = int(random(10, 30));
    speed = int(random(1, 6));
    ballType = typeSelection(); // sætter også colour;
    ballAlive = true;
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
  int typeSelection()
  {
    int i = int(random(0, 10));
    if (i <= 4) 
    {
      colour = #FF1A1A;
      ballType = i; // rød bold der skal reddes
      
    } 
    else if (i <= 8) 
    {
      colour = #02B715;
      ballType = i; // grøn bold skal gå ind
    } 
    else
    {
      colour = #0248B7;
      ballType = i; // blå skal reddes med "superKraft
    }
    return i;
  }

}
