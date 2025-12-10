import '/exports/exports.dart';

class TriviaOptionButton extends StatefulWidget {
  final String option;
  final int index;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;
  final VoidCallback onTap;
  final String optionLetter;

  const TriviaOptionButton({
    super.key,
    required this.option,
    required this.index,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
    required this.onTap,
    required this.optionLetter,
  });

  @override
  State<TriviaOptionButton> createState() => _TriviaOptionButtonState();
}

class _TriviaOptionButtonState extends State<TriviaOptionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getBackgroundColor(BuildContext context) {
    if (!widget.isAnswered) {
      return widget.isSelected
          ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
          : Colors.white;
    }

    if (widget.isCorrect) {
      return Colors.green.withValues(alpha: 0.15);
    }

    if (widget.isSelected && !widget.isCorrect) {
      return Colors.red.withValues(alpha: 0.15);
    }

    return Colors.white;
  }

  Color _getBorderColor(BuildContext context) {
    if (!widget.isAnswered) {
      return widget.isSelected
          ? Theme.of(context).primaryColor
          : Colors.grey.shade300;
    }

    if (widget.isCorrect) {
      return Colors.green;
    }

    if (widget.isSelected && !widget.isCorrect) {
      return Colors.red;
    }

    return Colors.grey.shade300;
  }

  IconData? _getIcon() {
    if (!widget.isAnswered) return null;

    if (widget.isCorrect) {
      return Icons.check_circle;
    }

    if (widget.isSelected && !widget.isCorrect) {
      return Icons.cancel;
    }

    return null;
  }

  Color? _getIconColor() {
    if (!widget.isAnswered) return null;

    if (widget.isCorrect) {
      return Colors.green;
    }

    if (widget.isSelected && !widget.isCorrect) {
      return Colors.red;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) {
        _animationController.reverse();
        if (!widget.isAnswered) {
          widget.onTap();
        }
      },
      onTapCancel: () => _animationController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _getBorderColor(context),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Option letter badge
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getBorderColor(context).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _getBorderColor(context),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.optionLetter,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _getBorderColor(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Option text
              Expanded(
                child: Text(
                  widget.option,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
              // Check/Cross icon
              if (_getIcon() != null) ...[
                const SizedBox(width: 8),
                Icon(
                  _getIcon(),
                  color: _getIconColor(),
                  size: 28,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
