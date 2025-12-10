import '/exports/exports.dart';
import '/models/trivia_model.dart';

class TriviaController with ChangeNotifier {
  List<TriviaQuestion> _questions = [];
  List<TriviaQuestion> get questions => _questions;

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;

  Map<int, int> _userAnswers = {};
  Map<int, int> get userAnswers => _userAnswers;

  int _score = 0;
  int get score => _score;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  bool _showExplanation = false;
  bool get showExplanation => _showExplanation;

  int? _selectedAnswerIndex;
  int? get selectedAnswerIndex => _selectedAnswerIndex;

  bool _quizCompleted = false;
  bool get quizCompleted => _quizCompleted;

  void initializeTrivia() {
    _questions = _getTriviaQuestions();
    _currentQuestionIndex = 0;
    _userAnswers = {};
    _score = 0;
    _isAnswered = false;
    _showExplanation = false;
    _selectedAnswerIndex = null;
    _quizCompleted = false;
    notifyListeners();
  }

  void selectAnswer(int answerIndex) {
    if (_isAnswered) return;

    _selectedAnswerIndex = answerIndex;
    _isAnswered = true;
    _userAnswers[_currentQuestionIndex] = answerIndex;

    if (answerIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }

    notifyListeners();
  }

  void toggleExplanation() {
    _showExplanation = !_showExplanation;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _isAnswered = false;
      _showExplanation = false;
      _selectedAnswerIndex = null;
      notifyListeners();
    } else {
      _quizCompleted = true;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      _isAnswered = _userAnswers.containsKey(_currentQuestionIndex);
      _selectedAnswerIndex = _userAnswers[_currentQuestionIndex];
      _showExplanation = false;
      notifyListeners();
    }
  }

  TriviaResult getResults() {
    int totalQuestions = _questions.length;
    int correctAnswers = _score;
    int incorrectAnswers = totalQuestions - correctAnswers;
    double percentage = (correctAnswers / totalQuestions) * 100;

    String grade;
    if (percentage >= 90) {
      grade = 'A+';
    } else if (percentage >= 80) {
      grade = 'A';
    } else if (percentage >= 70) {
      grade = 'B';
    } else if (percentage >= 60) {
      grade = 'C';
    } else {
      grade = 'D';
    }

    return TriviaResult(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      incorrectAnswers: incorrectAnswers,
      percentage: percentage,
      grade: grade,
    );
  }

  TriviaQuestion get currentQuestion => _questions[_currentQuestionIndex];

  double get progress => (_currentQuestionIndex + 1) / _questions.length;

  List<TriviaQuestion> _getTriviaQuestions() {
    return [
      TriviaQuestion(
        question: "What does HIV stand for?",
        options: [
          "Human Immunodeficiency Virus",
          "Human Infection Virus",
          "High Immunity Virus",
          "Health Infection Virus",
        ],
        correctAnswerIndex: 0,
        explanation: "HIV stands for Human Immunodeficiency Virus. It attacks the body's immune system, specifically the CD4 cells (T cells), which help the immune system fight off infections.",
        difficulty: 'easy',
      ),
      TriviaQuestion(
        question: "Can HIV be transmitted through casual contact like hugging or shaking hands?",
        options: [
          "Yes, it can be transmitted through any physical contact",
          "No, HIV is not transmitted through casual contact",
          "Only if there's visible sweat",
          "Yes, but only through prolonged contact",
        ],
        correctAnswerIndex: 1,
        explanation: "HIV is NOT transmitted through casual contact such as hugging, shaking hands, or sharing toilet seats. It is transmitted through specific bodily fluids like blood, semen, vaginal fluids, and breast milk.",
        difficulty: 'easy',
      ),
      TriviaQuestion(
        question: "What does AIDS stand for?",
        options: [
          "Acquired Infection Disease Syndrome",
          "Acquired Immunodeficiency Syndrome",
          "Automatic Immune Disease Syndrome",
          "Advanced Immunity Disorder Syndrome",
        ],
        correctAnswerIndex: 1,
        explanation: "AIDS stands for Acquired Immunodeficiency Syndrome. It is the most advanced stage of HIV infection, occurring when the immune system is severely damaged.",
        difficulty: 'easy',
      ),
      TriviaQuestion(
        question: "How long can it take for HIV symptoms to appear after infection?",
        options: [
          "Within 24 hours",
          "2-4 weeks for acute symptoms; years for AIDS",
          "Always within 6 months",
          "HIV never shows symptoms",
        ],
        correctAnswerIndex: 1,
        explanation: "Acute HIV symptoms can appear 2-4 weeks after infection (flu-like symptoms). However, without treatment, it can take several years before HIV develops into AIDS. Many people may not show symptoms for years.",
        difficulty: 'medium',
      ),
      TriviaQuestion(
        question: "Which of the following is NOT a way HIV is transmitted?",
        options: [
          "Unprotected sexual contact",
          "Sharing needles",
          "Mosquito bites",
          "Mother to child during pregnancy",
        ],
        correctAnswerIndex: 2,
        explanation: "HIV is NOT transmitted through mosquito bites. The virus cannot survive in mosquitoes. HIV is transmitted through blood, sexual fluids, and from mother to child during pregnancy, childbirth, or breastfeeding.",
        difficulty: 'medium',
      ),
      TriviaQuestion(
        question: "What is the primary target of HIV in the human body?",
        options: [
          "Red blood cells",
          "CD4+ T cells (immune cells)",
          "Liver cells",
          "Brain cells",
        ],
        correctAnswerIndex: 1,
        explanation: "HIV primarily targets CD4+ T cells (also called T-helper cells), which are crucial for immune system function. As HIV destroys these cells, the body becomes vulnerable to opportunistic infections.",
        difficulty: 'medium',
      ),
      TriviaQuestion(
        question: "Can a person with HIV who is on effective treatment and has an undetectable viral load transmit HIV to others?",
        options: [
          "Yes, they can still transmit HIV easily",
          "No, undetectable = untransmittable (U=U)",
          "Only during pregnancy",
          "Only through blood transfusion",
        ],
        correctAnswerIndex: 1,
        explanation: "When a person with HIV takes effective antiretroviral therapy (ART) and maintains an undetectable viral load, they cannot transmit HIV to others through sexual contact. This is known as U=U (Undetectable = Untransmittable).",
        difficulty: 'hard',
      ),
      TriviaQuestion(
        question: "What is PrEP?",
        options: [
          "A cure for HIV",
          "Pre-Exposure Prophylaxis - medication to prevent HIV",
          "Post-Exposure Recovery Program",
          "A type of HIV test",
        ],
        correctAnswerIndex: 1,
        explanation: "PrEP (Pre-Exposure Prophylaxis) is a daily medication that people at high risk for HIV can take to prevent getting infected. When taken consistently, PrEP is highly effective at preventing HIV transmission.",
        difficulty: 'medium',
      ),
      TriviaQuestion(
        question: "What is the window period for HIV testing?",
        options: [
          "The time between infection and when HIV can be detected by a test",
          "The opening hours of testing centers",
          "The time it takes to get test results",
          "The period when HIV is most contagious",
        ],
        correctAnswerIndex: 0,
        explanation: "The window period is the time between when a person gets infected with HIV and when a test can reliably detect the infection. This can range from 10 days to 3 months depending on the type of test used.",
        difficulty: 'hard',
      ),
      TriviaQuestion(
        question: "What does antiretroviral therapy (ART) do?",
        options: [
          "Cures HIV completely",
          "Prevents HIV infection",
          "Suppresses HIV replication and helps maintain immune function",
          "Only treats AIDS, not HIV",
        ],
        correctAnswerIndex: 2,
        explanation: "Antiretroviral therapy (ART) suppresses HIV replication in the body, allowing the immune system to recover and function properly. While ART doesn't cure HIV, it can keep viral loads undetectable and prevent progression to AIDS.",
        difficulty: 'medium',
      ),
      TriviaQuestion(
        question: "Can HIV be transmitted through saliva?",
        options: [
          "Yes, kissing is a major transmission route",
          "No, saliva contains enzymes that inhibit HIV",
          "Only if there are open sores",
          "Yes, through deep kissing only",
        ],
        correctAnswerIndex: 1,
        explanation: "HIV is NOT transmitted through saliva. Saliva contains enzymes that inhibit HIV. The virus is not transmitted through kissing, sharing utensils, or drinking from the same glass.",
        difficulty: 'easy',
      ),
      TriviaQuestion(
        question: "What is the most effective way to prevent sexual transmission of HIV?",
        options: [
          "Using hormonal birth control",
          "Consistent and correct use of condoms plus PrEP for high-risk individuals",
          "Having multiple partners",
          "Taking vitamins",
        ],
        correctAnswerIndex: 1,
        explanation: "The most effective prevention strategy combines consistent and correct condom use with PrEP (Pre-Exposure Prophylaxis) for individuals at high risk. This combination provides maximum protection against HIV transmission.",
        difficulty: 'medium',
      ),
    ];
  }
}
