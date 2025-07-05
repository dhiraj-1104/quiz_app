// Question Entity 
class QuestionEntity {
  final String question;
  final List<String> options;
  final int currentIndex;

  QuestionEntity({
    required this.question,
    required this.options,
    required this.currentIndex,
  });
}
