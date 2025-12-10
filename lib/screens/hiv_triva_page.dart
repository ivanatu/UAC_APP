import 'package:uac/exports/exports.dart';
import '/widgets/trivia_widgets/trivia_progress_bar.dart';
import '/widgets/trivia_widgets/trivia_question_card.dart';
import '/widgets/trivia_widgets/trivia_option_button.dart';
import '/widgets/trivia_widgets/trivia_result_screen.dart';

class HivTrivaPage extends StatefulWidget {
  const HivTrivaPage({super.key});

  @override
  State<HivTrivaPage> createState() => _HivTrivaPageState();
}

class _HivTrivaPageState extends State<HivTrivaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _pageAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _pageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pageAnimationController, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _pageAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );

    Provider.of<TriviaController>(context, listen: false).initializeTrivia();
    _pageAnimationController.forward();
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    super.dispose();
  }

  void _resetAnimation() {
    _pageAnimationController.reset();
    _pageAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TriviaController>(
      builder: (context, triviaController, child) {
        if (triviaController.quizCompleted) {
          return TriviaResultScreen(
            result: triviaController.getResults(),
            onRetry: () {
              triviaController.initializeTrivia();
              _resetAnimation();
            },
            onExit: () {
              // Navigator.of(context).pop();
            },
          );
        }

        final question = triviaController.currentQuestion;
        final isAnswered = triviaController.isAnswered;
        final selectedIndex = triviaController.selectedAnswerIndex;

        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            title: Text(
              "HIV Trivia Challenge",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.apply(fontWeightDelta: 2),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  _showInfoDialog(context);
                },
              ),
            ],
          ),
          body: SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // Progress bar
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TriviaProgressBar(
                        progress: triviaController.progress,
                        currentQuestion:
                            triviaController.currentQuestionIndex + 1,
                        totalQuestions: triviaController.questions.length,
                      ),
                    ),
                    // Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),
                            // Question card
                            TriviaQuestionCard(
                              question: question.question,
                              difficulty: question.difficulty,
                            ),
                            const SizedBox(height: 30),
                            // Options
                            ...List.generate(question.options.length, (index) {
                              final optionLetters = ['A', 'B', 'C', 'D'];
                              return TriviaOptionButton(
                                option: question.options[index],
                                index: index,
                                isSelected: selectedIndex == index,
                                isCorrect: index == question.correctAnswerIndex,
                                isAnswered: isAnswered,
                                onTap: () {
                                  triviaController.selectAnswer(index);
                                },
                                optionLetter: optionLetters[index],
                              );
                            }),
                            // Explanation
                            if (isAnswered) ...[
                              const SizedBox(height: 20),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.blue.shade200,
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.lightbulb,
                                          color: Colors.blue.shade700,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Explanation',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue.shade700,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      question.explanation,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            height: 1.6,
                                            color: Colors.grey.shade800,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    // Navigation buttons
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          if (triviaController.currentQuestionIndex > 0)
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  triviaController.previousQuestion();
                                  _resetAnimation();
                                },
                                icon: const Icon(Icons.arrow_back),
                                label: const Text('Previous'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          if (triviaController.currentQuestionIndex > 0)
                            const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton.icon(
                              onPressed: isAnswered
                                  ? () {
                                      triviaController.nextQuestion();
                                      _resetAnimation();
                                    }
                                  : null,
                              icon: Icon(
                                triviaController.currentQuestionIndex ==
                                        triviaController.questions.length - 1
                                    ? Icons.check_circle
                                    : Icons.arrow_forward,
                              ),
                              label: Text(
                                triviaController.currentQuestionIndex ==
                                        triviaController.questions.length - 1
                                    ? 'Finish'
                                    : 'Next',
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: Colors.grey.shade300,
                                disabledForegroundColor: Colors.grey.shade500,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.info, color: Theme.of(context).primaryColor),
              const SizedBox(width: 12),
              const Text('How to Play'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoItem('1. Read each question carefully', Icons.quiz),
              const SizedBox(height: 12),
              _buildInfoItem(
                '2. Select your answer from the options',
                Icons.touch_app,
              ),
              const SizedBox(height: 12),
              _buildInfoItem(
                '3. View the explanation after answering',
                Icons.lightbulb_outline,
              ),
              const SizedBox(height: 12),
              _buildInfoItem(
                '4. Navigate through questions and complete the quiz',
                Icons.navigate_next,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Learn about HIV/AIDS and help reduce stigma!',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Got it!',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoItem(String text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
