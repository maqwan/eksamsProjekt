GameMasterModel gameMaster; //<>//
KeeperModel keeper;
boolean boolUpDifficulty;
int currentDiffculty;

void setup()
{
  currentDiffculty = 5;
  keeper = new KeeperModel(true,false);
  gameMaster = new GameMasterModel(currentDiffculty);// ballIndex
  gameMaster.initballs();
  size(800, 800);

}

void draw()
{ //<>//
  background(255);
  keeper.drawKeeper();
  gameMaster.drawBalls();
  gameMaster.collisionDetection();
  gameMaster.ResendBalls();
  boolUpDifficulty = gameMaster.increaseDifficulty();
  upDifficulty();
  println(gameMaster.score);
}

void upDifficulty()
{
  if(boolUpDifficulty == true)
  {
  currentDiffculty = currentDiffculty+1;
  gameMaster = new GameMasterModel(currentDiffculty);
  gameMaster.initballs();
  boolUpDifficulty = false;
  }
}

void reInitGame()
{
if(keeper.isAlive == false)
{
 currentDiffculty = 5;
 gameMaster = new GameMasterModel(currentDiffculty);
 keeper = new KeeperModel(true,false);
 gameMaster.initballs();
}
}

void mousePressed()
{
  if(mouseButton == LEFT && keeper.isAlive == true) // must check for alive else you can bring your self back to life
  {
   keeper = new KeeperModel(true,false);
  }
  if(mouseButton == RIGHT && keeper.isAlive == true)// must check for alive else you can bring your self back to life
  {
   keeper = new KeeperModel(false,true);
  }

}   

void keyPressed()
{
  if(key =='r')
  {
  reInitGame();
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
