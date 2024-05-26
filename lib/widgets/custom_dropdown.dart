import '/exports/exports.dart';

class CustomDropdown extends StatelessWidget {
  final ValueChanged onChanged;
  final BoxConstraints constraint;
  final String? value;
  const CustomDropdown(
      {super.key,
      required this.onChanged,
      required this.constraint,
      this.value});

  @override
  Widget build(BuildContext context) {
    return //DropDown
        Container(
      width: constraint.maxWidth * 0.63,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        // border: Border.all(
        color: Theme.of(context).primaryColor,
        //   width: 1.2,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      child: Center(
        child: Theme(
          data: ThemeData(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            itemHeight: 50,
            value: value,
            underline: Container(
              height: 0,
            ),
            elevation: 20,
            iconSize: 28,
            icon: const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                value: "publishedAt",
                child: SizedBox(
                  width: 55,
                  child: AutoSizeText(
                    "Latest",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    stepGranularity: 1,
                    maxFontSize: 17,
                    maxLines: 1,
                  ),
                ),
              ),
              const DropdownMenuItem(
                value: "popular",
                child: SizedBox(
                  width: 68,
                  child: AutoSizeText(
                    "Popular",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    stepGranularity: 1,
                    maxFontSize: 17,
                    maxLines: 1,
                  ),
                ),
              ),
              const DropdownMenuItem(
                value: "Last Week",
                child: SizedBox(
                  width: 90,
                  child: AutoSizeText(
                    "Last Week",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    stepGranularity: 1,
                    maxFontSize: 17,
                    maxLines: 1,
                  ),
                ),
              ),
              const DropdownMenuItem(
                value: "Last 15",
                child: SizedBox(
                  width: 99,
                  child: AutoSizeText(
                    "Last 15 days",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    stepGranularity: 1,
                    maxFontSize: 17,
                    maxLines: 1,
                  ),
                ),
              ),
              const DropdownMenuItem(
                value: "Last Month",
                child: SizedBox(
                  width: 97,
                  child: AutoSizeText(
                    "Last Month",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    stepGranularity: 1,
                    maxFontSize: 17,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
            onChanged: (newValue) {
              onChanged(newValue);
            },
          ),
        ),
      ),
    );
  }
}
