class ActivityModel {
  const ActivityModel({
    required this.id,
    required this.title,
    required this.language,
    required this.description,
    required this.concept,
    required this.difficulty,
    required this.estimatedMinutes,
    required this.objective,
    required this.problemStatement,
    required this.steps,
    required this.exampleInput,
    required this.exampleOutput,
    required this.starterCode,
    required this.hints,
    required this.successCriteria,
  });

  final String id;
  final String title;
  final String language;
  final String description;
  final String concept;
  final String difficulty;
  final int estimatedMinutes;
  final String objective;
  final String problemStatement;
  final List<String> steps;
  final String exampleInput;
  final String exampleOutput;
  final String starterCode;
  final List<String> hints;
  final List<String> successCriteria;
}
