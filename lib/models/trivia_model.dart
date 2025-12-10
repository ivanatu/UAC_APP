class TriviaQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String difficulty; // 'easy', 'medium', 'hard'

  TriviaQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.difficulty,
  });
}

class TriviaResult {
  final int totalQuestions;
  final int correctAnswers;
  final int incorrectAnswers;
  final double percentage;
  final String grade;

  TriviaResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.percentage,
    required this.grade,
  });

  String get message {
    if (percentage >= 90) return "Outstanding! You're an HIV awareness expert!";
    if (percentage >= 80) return "Excellent work! You have great knowledge about HIV.";
    if (percentage >= 70) return "Good job! Keep learning about HIV awareness.";
    if (percentage >= 60) return "Not bad! There's room for improvement.";
    return "Keep learning! HIV awareness is important.";
  }
}
