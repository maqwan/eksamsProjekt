class GameMasterModel //<>//
{
  BallModel ball;
  BallModel[] balls;
  TimerModel difficultyTimer;
  TimerModel ballTimer;
  ScoreModel scoreBoard;

  int ballsIndex;
  int score;
  int totalBalls;
  int ballCounter;

  int ballMaxSpeed;
  int ballMaxSize;

  GameMasterModel()
  {
    scoreBoard = new ScoreModel();
    ball = new BallModel();
    ballMaxSpeed = ball.maxSpeed; //sets same speed as "base" ball
    ballMaxSize = ball.maxSize;//sets same size as "base" ball

    ballCounter = 1000; // sets initial speed to 1 sec for balls to spaw

    totalBalls = 0; // amout of balls in the array
    ballsIndex = 100000;  // max size of array
    balls = new BallModel[ballsIndex]; //initializes the array
    
    difficultyTimer = new TimerModel(5000); // sets difficulty timer to 5 sec 
    difficultyTimer.start(); // starts the difficulty timer
    
    ballTimer = new TimerModel(ballCounter); // sets timer for the next ball to spawn
    ballTimer.start(); // starts the timer for the ball
  }

  void increaseDifficulty()
  {
    if (difficultyTimer.isFinished() == true) // if the difficulty timer has finished its increased
    {
      ballMaxSpeed = ballMaxSpeed+1; // increasses max ball speed
      ballMaxSize = ballMaxSize+(ballMaxSize/10); //grow exponentially with own size
      
      difficultyTimer.start(); // restarts the timer.

      ballCounter = ballCounter-100; // decreased the time of the counter to make the game go faster
      ballTimer = new TimerModel(ballCounter); // new timer with lower value
      scoreBoard.difficulty = scoreBoard.upDifficulty(); // increases the score by 1
    }
  }

  void addBall() // adds a new ball to the next empty spot in the array
  { 
    if (ballTimer.isFinished()) // adds new ball if the timer has finished
    { 
      balls[totalBalls] = new BallModel(ballMaxSize, ballMaxSpeed); // adds new ball to the next empty position in the array.
      totalBalls++; // increases the array of 1 
      ballTimer.start(); // restarts the timer
    }
  }

  void reInitializeBalls() // creates new ball if its out of bound and decreases your score with 1;
  {
    for (int i = 0; i < totalBalls; i++) // totalBalls
    {
      if (balls[i].isBallAlive == true && balls[i].y > (height + balls[i].size)) //only initialize the ball if its alive and outside screen
      {
        ball = new BallModel(ballMaxSize, ballMaxSpeed);
        balls[i] = ball;
        scoreBoard.score = scoreBoard.downScore();
      }
    }
  }

  void collisionDetection()
  {

    // size /2 is used to get edge collision. as ball size can vary. 
    // booleans is used to check of the keeper and ball have the same colour.
    // balls that are touched already are considered "dead" and isnt drawn, boolean isBallAlive is used to avid invicible collisions.

    for (int i = 0; i < totalBalls; i++) 
    {
      float D = int(dist(mouseX, mouseY, balls[i].x, balls[i].y)); // distance between current ball and keeper.

      if (D <= (keeper.size/2 + balls[i].size/2)&& balls[i].isBallAlive == true && keeper.redKeeper == true && balls[i].redBall == true)
      //check if the ball and keeper is red and the ball is alive;
      {
        scoreBoard.score = scoreBoard.upScore();
        balls[i].isBallAlive = false; // "kills" the ball
      }
      else if (D <= (keeper.size/2 + balls[i].size/2)&& balls[i].isBallAlive == true && keeper.blueKeeper == true && balls[i].blueBall == true)
      //check if the ball and keeper is blue and the ball is alive;
      {
        scoreBoard.score = scoreBoard.upScore();
        balls[i].isBallAlive = false; // "kills" the ball
      }
      else if (D <= (keeper.size/2 + balls[i].size/2)&& balls[i].isBallAlive == true && keeper.blueKeeper == true && balls[i].redBall == true)
      //if the ball is red and keeper is blue, the keeper dies
      {
        keeper.isAlive = false;
      } 
      else if (D <= (keeper.size/2 + balls[i].size/2) && balls[i].isBallAlive == true && keeper.redKeeper == true && balls[i].blueBall == true)
      //if the keeper is red and the ball is blue ,the keeper dies
      {
        keeper.isAlive = false;
      }
    }
  }

  void drawBalls()
  {
      for (int i = 0; i < totalBalls; i++) // only draws and moves active balls
      {
        if (balls[i].isBallAlive == true)
        {
          balls[i].drawBall();
          balls[i].moveBall();
        }
      }
    
  }
}
