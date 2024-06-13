import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:aids_awareness_app/controllers/faqa_controller.dart';

import '/exports/exports.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FaqaController>(context, listen: false).setItems();
  }

  // no data
  Widget noData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/svgs/no_faq.svg",
            height: 300,
            width: 300,
          ),
        ),
        Text(
          "No FAQs available",
          style: Theme.of(context).textTheme.titleLarge!.apply(
                // color: Colors.grey.shade500,
                fontFamily: 'Monospace',
              ),
        ),
      ],
    );
  }

//  loading
  Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        strokeWidth: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: "faqs", child: Text("FAQs")),
      ),
      body: Consumer<FaqaController>(builder: (context, faqaController, child) {
        if (faqaController.loading) {
          return loading();
        } else if (faqaController.items.isEmpty) {
          return noData();
        } else {
          return Accordion(
            headerBorderColor: Colors.blueGrey,
            headerBorderColorOpened: Colors.transparent,
            // headerBorderWidth: 1,
            headerBackgroundColorOpened: Theme.of(context).primaryColor,
            contentBackgroundColor: Colors.white,
            contentBorderColor: Theme.of(context).primaryColor,
            contentBorderWidth: 1,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: List.generate(faqaController.items.length, (index) {
              var data = faqaController.items[index];
              return AccordionSection(
                isOpen: true,
                contentVerticalPadding: 10,
                // leftIcon:
                //     const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: Text(
                  data.attributes.title,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeightDelta: 2,
                      ),
                ),
                content: Text(
                  data.attributes.answer,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                ),
              );
            }),
          );
        }
      }),
    );
  }
}
