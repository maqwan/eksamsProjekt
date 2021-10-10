class GameMasterModel
{
  BallModel ball;
  BallModel[] balls;

  int ballsIndex;
  int currentBallIndex;
  int score;

  boolean nextLevel;

  GameMasterModel()
  {
    ballsIndex = 5; //constructor used for the first instance of the game
    balls = new BallModel[ballsIndex];
    initBalls();
  }

  GameMasterModel(int tempBallsIndex)
  {
    ballsIndex = tempBallsIndex; 
    balls = new BallModel[ballsIndex];
    initBalls();
  }

  boolean isNextLevelValid()
  {
    boolean output = false;

    for (int i = 0; i < ballsIndex; i++)
    {
      if (balls[i].isBallAlive == false)
      {
        output = true;
      } else
      {
        output = false;
        return output;
      }
    }
    return output;
  }

  void reInitializeBalls()
  {
    for (int i = 0; i < ballsIndex; i++)
    {
      if (balls[i].isBallAlive == true && balls[i].y > (height + balls[i].size)) // make sure they exit the screen
      {
        ball = new BallModel();
        balls[i] = ball;
      }
    }
  }

  void collisionDetection()
  {

    // size /2 is used to get edge collision. as ball size can vary. 
    // booleans is used to check of the keeper and ball have the same colour.
    // balls that are touched already are considered "dead" and isnt drawn, isBallAlive is used to avid invicible collisions.

    for (int i = 0; i < ballsIndex; i++)
    {
      float D = int(dist(mouseX, mouseY, balls[i].x, balls[i].y)); // distance between current ball and keeper.


      if (D <= (keeper.size/2 + balls[i].size/2)&& balls[i].isBallAlive == true && keeper.redKeeper == true && balls[i].redBall == true)
      {
        score++;
        balls[i].isBallAlive = false;
      } else if (D <= (keeper.size/2 + balls[i].size/2)&& balls[i].isBallAlive == true && keeper.blueKeeper == true && balls[i].blueBall == true)
      {
        score++;
        balls[i].isBallAlive = false;
      } else if (D <= (keeper.size/2 + balls[i].size/2)&& balls[i].isBallAlive == true && keeper.blueKeeper == true && balls[i].redBall == true)
      {
        keeper.isAlive = false;
      } else if (D <= (keeper.size/2 + balls[i].size/2) && balls[i].isBallAlive == true && keeper.redKeeper == true && balls[i].blueBall == true)
      {
        keeper.isAlive = false;
      }
    }
  }

  void drawBalls()
  {
    if (keeper.isAlive == true)
    {
      for (int i = 0; i < ballsIndex; i++)
      {
        if (balls[i].isBallAlive == true)
        {
          balls[i].drawBall();
          balls[i].moveBall();
        }
      }
    }
  }
  void initBalls()
  {
    for (int i = 0; i < ballsIndex; i++)
    {
      ball = new BallModel();
      balls[i] = ball;
    }
  }
}
