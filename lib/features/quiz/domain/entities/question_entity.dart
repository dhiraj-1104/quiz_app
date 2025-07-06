// Question Entity 
class QuestionEntity {
  final String question;
  final List<String> options;
  final int correctIndex;
  final List<String> context;

  QuestionEntity( {
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.context,
  });
}
