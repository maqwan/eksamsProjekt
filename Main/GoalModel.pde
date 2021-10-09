class GoalModel
{
  int offSet;
  
  GoalModel()
  {
    offSet = 40;
  }

  void drawGoal(int tempOffset)
  {
    offSet = tempOffset;
    line(0, height-(offSet), height, height-(offSet));
  }
}
