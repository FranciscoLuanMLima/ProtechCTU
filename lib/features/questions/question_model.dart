class QuestionModel {
  const QuestionModel({
    required this.id,
    required this.title,
    required this.options,
  });

  final String id;
  final String title;
  final List<String> options;
}
