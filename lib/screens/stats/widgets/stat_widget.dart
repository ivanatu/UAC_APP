import '/exports/exports.dart';

class StatWidget extends StatelessWidget {
  final Widget nextPage;
  final String title;
  final IconData icon;
  final Color color;
  const StatWidget(
      {super.key,
      required this.nextPage,
      required this.title,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var textGroup = AutoSizeGroup();
    return Routes.animateTo(
      closedWidget: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      icon,
                      color: color,
                    ),
                    backgroundColor: color.withOpacity(0.15),
                  ),
                  Space(),
                  AutoSizeText(
                    title,
                    maxLines: 4,
                    group: textGroup,
                    // maxFontSize: 14,
                    minFontSize: 10,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          fontWeightDelta: 2,
                          fontFamily: 'Montserrat',
                          color: Colors.grey.shade800,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Space(),
              Icon(
                Icons.open_in_new_rounded,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
      openWidget: nextPage,
    );
  }
}
