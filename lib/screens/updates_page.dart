import '../services/update_service.dart';
import '/widgets/custom_dropdown.dart';
import '../widgets/news_widgets/news_tile.dart';
import '../widgets/news_widgets/updates_page_carousel.dart';
import '../network_requests/exceptions.dart';
import '../widgets/skeletons/news_list_skeleton.dart';
import '/exports/exports.dart';

class UpdatesScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  UpdatesScreen({Key? key, this.imgPath, required this.color})
      : super(key: key);

  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  String dropDownValue = "publishedAt";

  var _newsFuture;

  refresh() async {
    await Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _newsFuture = UpdateService.getNews();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _newsFuture = UpdateService.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "AIDS Info",
          style: TextStyle(
            // color: Colors.teal[800],
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          stepGranularity: 2,
          maxFontSize: 20,
          minFontSize: 14,
          maxLines: 1,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _newsFuture = null;
                refresh();
              });
            },
            icon: Icon(
              Icons.refresh,
              // color: Colors.teal[800],
              size: 26,
            ),
          ),
        ],
      ),
      body: BottomTopMoveAnimationView(
        // height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: LayoutBuilder(
            builder: (ctx, constraint) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Carousel
                ImageCarousel(
                  height: constraint.maxHeight * 0.26,
                ),

                //Sorting + drop down
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Sort by
                    Padding(
                      padding: MediaQuery.of(context).size.width > 360.0
                          ? EdgeInsets.only(left: 20)
                          : EdgeInsets.only(left: 0),
                      child: LimitedBox(
                        maxWidth: 60,
                        child: AutoSizeText(
                          "Sort By",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            // color: Colors.teal[800],
                            fontWeight: FontWeight.w600,
                          ),
                          stepGranularity: 2,
                          maxFontSize: 18,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width > 340.0 ? 10 : 7,
                    ),
                    Expanded(
                        child: const Icon(
                      Icons.filter_list,
                      size: 20,
                    )),

                    SizedBox(width: 10),
                    // custom drop down
                    CustomDropdown(
                      value: dropDownValue,
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValue = newValue ?? "";
                          _newsFuture = UpdateService.getNews();
                        });
                      },
                      constraint: constraint,
                    )
                  ],
                ),

                //Divider
                Divider(
                  color: Theme.of(context).primaryColor,
                  height: 15,
                  thickness: 1.2,
                ),

                //News tiles
                FutureBuilder<dynamic>(
                  future: _newsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.data == null ||
                        snapshot.connectionState != ConnectionState.done) {
                      return NewsListLoader();
                    } else if (snapshot.data is FetchDataException) {
                      return Center(
                        child: AutoSizeText(
                          snapshot.data.toString(),
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          maxFontSize: 16,
                          stepGranularity: 2,
                        ),
                      );
                    } else {
                      return Flexible(
                        flex: 3,
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return NewsTile(
                              article: snapshot.data[index],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
