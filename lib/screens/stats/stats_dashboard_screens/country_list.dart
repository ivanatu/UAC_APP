import '/widgets/stats_widgets/countries_grid.dart';
import '/widgets/skeletons/country_list_skeleton.dart';
import '/models/summary_each_country.dart';
import '/exports/exports.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<SummaryEachCountry> countries = []; // Initialize with an empty list
  String searchValue = '';
  Color? themeColor;

  void getCountriesList() {
    final districts = [
      // ["Kampala", "30000", "1000", "2000", "true"],
      // ["Jinja", "40000", "5000", "3000", "false"],
      // ["Masaka", "3430", "1400", "12000", "true"],
      // ["Entebbe", "9000", "5000", "2500", "true"],
      // ["Mukono", "90000", "43000", "200", "false"],
      // ["Rakai", "32100", "9800", "2130", "true"]
      ["West Nile", "2", "9", "0", "true"],
      ["Mid North", "6", "0", "0", "true"],
      ["North East", "2", "0", "0", "true"],
      ["Mid Western", "4", "0", "0", "true"],
      ["North Buganda", "6", "0", "0", "true"],
      ["East Central", "3", "0", "0", "true"],
      ["Mid Eastern", "2", "0", "0", "true"],
      ["South Western", "6", "0", "0", "true"],
      ["South Buganda", "8", "0", "0", "true"],
      ["Kampala", "6", "0", "0", "true"]
    ];

    districts.forEach((element) {
      SummaryEachCountry summary = SummaryEachCountry().formMap(element);
      countries.add(summary);
    });
  }

  List<SummaryEachCountry> getFilteredCountries() {
    if (searchValue.isEmpty) {
      return countries;
    }
    String search = searchValue.toLowerCase();
    return countries
        .where((country) => country.country.toLowerCase().startsWith(search))
        .toList();
  }

  void _clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    themeColor = Color(0xff52b9aa);
    getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Uganda Regions",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => _clearFocus(context),
        child: Column(
          children: <Widget>[
            //Search Bar
            Card(
              elevation: 0,
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  cursorColor: themeColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Search Any Region",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  onChanged: (String val) {
                    setState(() {
                      searchValue = val;
                    });
                  },
                ),
              ),
            ),
            //Countries Grid
            Expanded(
              child: countries.isEmpty
                  ? CountryListLoader()
                  : CountriesGrid(
                      list: getFilteredCountries(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
