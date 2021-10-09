class GameMasterModel
{
  BallModel ball;
  BallModel[] balls;

  int ballsIndex;
  int score;

  GameMasterModel(int tempBallsIndex)
  {
    ballsIndex = tempBallsIndex; 
    balls = new BallModel[ballsIndex];
  }

  boolean increaseDifficulty()
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

  void ResendBalls()
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
    for (int i = 0; i < ballsIndex; i++)
    {
      float D = int(dist(mouseX, mouseY, balls[i].x, balls[i].y));
      if (D <= (keeper.size/2 + balls[i].size/2) && keeper.redKeeper == true && balls[i].redBall == true)
      {
        score++;
        balls[i].isBallAlive = false;
        balls[i].sendOutOfBound();
      } else if (D <= keeper.size/2 + balls[i].size/2 && keeper.blueKeeper == true && balls[i].blueBall == true)
      {
        score++;
        balls[i].isBallAlive = false;
        balls[i].sendOutOfBound();
      } else if (D <= keeper.size/2 + balls[i].size/2 && keeper.blueKeeper == true && balls[i].redBall == true)
      {
        keeper.isAlive = false;
      } else if (D <= keeper.size/2 + balls[i].size/2 && keeper.redKeeper == true && balls[i].blueBall == true)
      {
        keeper.isAlive = false;
      }
    }
  }
  void drawBalls()
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
  void initballs()
  {
    for (int i = 0; i < ballsIndex; i++)
    {
      ball = new BallModel();
      balls[i] = ball;
      //for (int g = 0; g < ballsIndex; g++)
      //{
      //  float D = dist(balls[i].x, balls[i].y, balls[g].x, balls[g].y);
      //  if(D <= (balls[i].size/2 + balls[g].size/2))
      //  {
      //   ball = new BallModel();
      //   balls[g] = ball;
      //  }

      //}
    }
  }
}
