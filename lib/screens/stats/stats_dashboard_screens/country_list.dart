import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/stats_widgets/countries_grid.dart';
import '../../../widgets/skeletons/country_list_skeleton.dart';
import '../../../models/summary_each_country.dart';

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
    return GestureDetector(
      onTap: () => _clearFocus(context),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: AutoSizeText(
              "Search Any Region",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF424242),
              ),
              stepGranularity: 1,
              maxFontSize: 20,
            ),
          ),

          //Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(0, 0.8),
                )
              ],
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TextFormField(
              cursorColor: themeColor,
              style: TextStyle(
                color: themeColor,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                fontSize: MediaQuery.of(context).size.width < 360.0 ? 16 : 18,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 17,
                ),
                hintText: "Region Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: themeColor!,
                    width: 1.4,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: themeColor!,
                    width: 1.4,
                    style: BorderStyle.solid,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: themeColor,
                  size: 21,
                ),
              ),
              onChanged: (String val) {
                setState(() {
                  searchValue = val;
                });
              },
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
    );
  }
}
