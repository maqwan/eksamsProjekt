BallModel ball; //<>//
GoalModel goal;
BallModel[] balls;
KeeperModel keeper;
void setup()
{
  size(800, 800);
  ball = new BallModel();
  balls = new BallModel[5];
  goal = new GoalModel();
  keeper = new KeeperModel(#FA08FF);//colour
  initballs();
}

void draw()
{
  background(255);
  keeper.drawKeeper();
  keeper.moveKeeper();
  goal.drawGoal(40);


  for (int i = 0; i < 5; i++)
  {
    balls[i].drawBall();
    balls[i].moveBall();
  }
}

void keyPressed()
{
  if (key == 'a')
  {
    keeper.boolLeft = true;
    keeper.boolRight = false;
  }
  if (key == 'd')
  {
    keeper.boolLeft = false;
    keeper.boolRight = true;
  }
    if (key == 's')
  {
    keeper.boolLeft = false;
    keeper.boolRight = false;
  }
      if (key == 'e')
  {
    keeper.IsPowerActive = true;
  }
        if (key == 'q')
  {
    keeper.IsPowerActive = false;
  }
}
void initballs()
{
  for (int i = 0; i < 5; i++)
  {
    ball = new BallModel();
    balls[i] = ball;
  }
}

//eksamens projekt
//få variabler med som int, string, float, boolean
// få  system variabler med 
// få referencer med Arrays()
// få loops med. husk at tænk på draw()
// få funktion/methods med, med overload
// få classes med og constructors med.
// få modol fætteren med timer?
// få nogen conditions med som if statement
// spillet går ud på du er en mål mand som skal redde bolde, det som giver spillet variation er at der kommer bolde med forskellige farver
// nogen bolde skal gå ind, og nogen kan du først redde når du har klikket på space/musse knap.

// bolde class som indeholder 3 bolde, grøn(dem skal du redde), gule(dem skal du have noget aktivt for at redde), røde( skal gå ind)
//bolde class skal indeholde x,y,size,move(),draw(), add til array, hvilken type er den, er den reddet eller ej,

// mål mand class som indeholder x,y,size, move(),draw(), bool aktiv at redde blå bolde?

//mål klasse som indeholder liv, fx 3 liv hvis for mange af de forkerte går ind så dør du.
//
