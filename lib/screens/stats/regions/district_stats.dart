import 'package:aids_awareness_app/screens/stats/regions/district_data.dart';
import 'package:aids_awareness_app/services/regions_service.dart';

import '/exports/exports.dart';

class DistrictStats extends StatefulWidget {
  const DistrictStats({super.key});

  @override
  State<DistrictStats> createState() => _DistrictStatsState();
}

class _DistrictStatsState extends State<DistrictStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        title: Text(
          'Select a region',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 3,
                fontFamily: 'Montserrat',
              ),
        ),
      ),
      // fetch all regions
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight * 0.025,
              decoration: BoxDecoration(
                color: Colors.cyan.shade600,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            FutureBuilder(
              future: RegionService().getRegions(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: EdgeInsets.fromLTRB(10, 30, 5, 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Color color = Colors
                          .primaries[(index * 7) % Colors.primaries.length];
                      return Routes.animateTo(
                        openWidget: DistrictData(
                          index: index,
                          color: color,
                          region: snapshot.data![index],
                        ),
                        closedWidget: Card(
                          elevation: 0,
                          color: Colors
                              .primaries[(index * 7) % Colors.primaries.length]
                              .shade50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.primaries[
                                    (index * 7) % Colors.primaries.length],
                                width: 1,
                              )),
                          child: GridTile(
                            child: Center(
                              child: Icon(
                                Icons.pie_chart_rounded,
                                size: 50,
                                color: Colors.primaries[
                                    (index * 7) % Colors.primaries.length],
                              ),
                            ),
                            footer: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  snapshot.data![index].attributes.title,
                                  style: TextStyle(
                                    color: Colors.primaries[
                                        (index * 7) % Colors.primaries.length],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            // onTap: () {},
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
