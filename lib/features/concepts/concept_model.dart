class ConceptModel {
  const ConceptModel({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.estimatedMinutes,
    required this.objectives,
    required this.explanation,
    required this.exampleCode,
    required this.exampleExplanation,
    required this.guidedSteps,
    required this.checkpointQuestion,
    required this.checkpointAnswer,
    required this.nextTopic,
  });

  final String id;
  final String title;
  final String description;
  final String difficulty;
  final int estimatedMinutes;
  final List<String> objectives;
  final String explanation;
  final String exampleCode;
  final String exampleExplanation;
  final List<String> guidedSteps;
  final String checkpointQuestion;
  final String checkpointAnswer;
  final String? nextTopic;
}
