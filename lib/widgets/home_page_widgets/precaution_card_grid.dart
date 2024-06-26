import '/exports/exports.dart';

class PrecautionCardGrid extends StatefulWidget {
  @override
  _PrecautionCardGridState createState() => _PrecautionCardGridState();
}

class _PrecautionCardGridState extends State<PrecautionCardGrid> {
  int selectedIndex = 0;

  static AutoSizeGroup titleGrp = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Consumer<PrecautionController>(builder: (context, controller, x) {
      controller.getPrecautionList();
      return controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 15.0,
                crossAxisCount: 2,
                childAspectRatio: 0.99,
              ),
              scrollDirection: Axis.vertical,
              itemCount: controller.precautionList.length,
              itemBuilder: (context, index) {
                var data = controller.precautionList.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Card(
                    elevation: 0,
                    color: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 650),
                      decoration: BoxDecoration(
                        // color:
                        //     index == selectedIndex ? Colors.teal[50] : Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                      child: LayoutBuilder(
                        builder: (ctx, constraint) => Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.network(
                              Apis.url +
                                  data.attributes.image.data.attributes.url,
                              width: constraint.maxWidth * 0.6,
                              height: constraint.maxHeight * 0.5,
                            ),

                            AutoSizeText(
                              "\n${data.attributes.shortMessage}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Montserrat",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              maxFontSize: 14,
                              maxLines: 3,
                              minFontSize: 11,
                              stepGranularity: 1,
                              group: titleGrp,
                            ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            // LimitedBox(
                            //   maxHeight: constraint.maxHeight * 0.30,
                            //   child: AutoSizeText(
                            //     "${preventions[index]['desc']}",
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //       fontSize: 12,
                            //       fontFamily: "Montserrat",
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //     maxFontSize: 12,
                            //     minFontSize: 9,
                            //     group: descGrp,
                            //     stepGranularity: 1,
                            //     maxLines: 4,
                            //   ),
                            // ),
                            // SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
