class ScoreModel
{

  PFont f;
  int score;
  int difficulty;
  ScoreModel()
  {
    difficulty = 0;
    score =0;
    f = loadFont("Arial-BoldMT-48.vlw");
    fill(0);
  }

  void showScore()
  {
    textFont(f, 20);
    fill(0); 
    text ("difficulty: " + difficulty + "\n"+"score: " + score,width/3,100);
  }
  
  void finalScore()
  {
    textFont(f, 20);
    fill(0); 
    text (" you died \n total score: " + score*difficulty,width/3,100);
  }
  int upScore()
  {
    score = score+1;
    return score;
  }
   int downScore()
  {
    score = score-1;
    return score;
  }
   int upDifficulty()
  {
    difficulty = difficulty+1;
    return difficulty;
  }
   int downDifficulty()
  {
    difficulty = difficulty-1;
    return difficulty;
  }
}
