class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getSuffledAnswers(){
  final suffledList=List.of(answers);
  suffledList.shuffle();
  return suffledList;
}
}