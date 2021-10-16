GameMasterModel gameMaster;
KeeperModel keeper;


void setup()
{
  keeper = new KeeperModel(true, false);
  gameMaster = new GameMasterModel();
  
  size(800, 800);
}

void draw()
{
  background(255);
  if(keeper.isAlive == true) // if your alive the game continues
  {
  gameMaster.addBall();
  keeper.drawKeeper();
  gameMaster.drawBalls();
  gameMaster.collisionDetection();
  gameMaster.reInitializeBalls();
  gameMaster.increaseDifficulty();
  gameMaster.scoreBoard.showScore();
  }
  else
  {
    gameMaster.scoreBoard.finalScore(); // shows total score if you die
  }
  
}

void reInitGame()// restarts the game if your dead
{
  if (keeper.isAlive == false)
  {
    gameMaster = new GameMasterModel();
    keeper = new KeeperModel(true, false);
  }
}
void mousePressed()
{
  if (mouseButton == LEFT && keeper.isAlive == true) // must check for alive else you can bring your self back to life
  {
    keeper = new KeeperModel(true, false);
  }
  if (mouseButton == RIGHT && keeper.isAlive == true)// must check for alive else you can bring your self back to life
  {
    keeper = new KeeperModel(false, true);
  }
}   

void keyPressed()
{
  if (key =='r')
  {
    reInitGame();
  }
}


// spillet går ud på du er en mål mand som skal redde bolde, det som giver spillet variation er at der kommer bolde med forskellige farver
// du skal fange boldene med den samme farve "keeper" som bolden ved at klippe på musen.
