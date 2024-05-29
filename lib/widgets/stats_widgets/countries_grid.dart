import '../../screens/stats/stats_dashboard_screens/country_stat.dart';
import '../../values/country_color_data.dart';
import '../../models/summary_each_country.dart';
import '/exports/exports.dart';
import 'country_list_item.dart';

// ignore: must_be_immutable
class CountriesGrid extends StatefulWidget {
  List<SummaryEachCountry> list;

  CountriesGrid({required this.list});

  @override
  _CountriesGridState createState() => _CountriesGridState();
}

class _CountriesGridState extends State<CountriesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 1.03, //2 / 2.9,
      ),
      itemCount: widget.list.length,
      itemBuilder: (ctx, i) {
        return Routes.animateTo(
          openWidget: CountryStatScreen(
            color: colordata[i % colordata.length].backgroundColor,
            countryName: widget.list[i].country,
            countryCode: widget.list[i].code,
            totalCases: widget.list[i].totalCases,
            isIncreasing: widget.list[i].isIncreasing,
            todayCases: widget.list[i].todayCases,
            newDeaths: widget.list[i].newDeaths,
            critical: widget.list[i].critical,
            active: widget.list[i].active,
            totalDeaths: widget.list[i].totalDeaths,
            totalRecovered: widget.list[i].totalRecovered,
            testsConducted: widget.list[i].testsConducted,
          ),
          closedWidget: CountryListItem(
              height: 160,
              countryName: widget.list[i].country,
              countryCode: widget.list[i].code,
              value: widget.list[i].totalCases,
              // flagPath: widget.list[i].flagPath,
              isIncreasing: widget.list[i].isIncreasing,
              itemColorData: colordata[i % colordata.length],
              active: widget.list[i].active,
              critical: widget.list[i].critical,
              newDeaths: widget.list[i].newDeaths,
              testsConducted: widget.list[i].testsConducted,
              todayCases: widget.list[i].todayCases,
              totalDeaths: widget.list[i].totalDeaths,
              totalRecovered: widget.list[i].totalRecovered),
        );
      },
    );
  }
}
