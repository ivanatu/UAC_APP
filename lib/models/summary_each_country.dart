class SummaryEachCountry {
  final String country;
  final String code;
  final int todayCases;
  final int totalCases;
  final int newDeaths;
  final int critical;
  final int active;
  final int totalDeaths;
  final int totalRecovered;
  final bool isIncreasing;
  final int testsConducted;

  SummaryEachCountry(
      {this.country,
      this.code,
      this.todayCases,
      this.totalCases,
      this.active,
      this.newDeaths,
      this.totalDeaths,
      this.totalRecovered,
      this.isIncreasing,
      this.critical,
      this.testsConducted});

  SummaryEachCountry formMap(List<String> data) {
    return SummaryEachCountry(
        country: data[0],
        code: "23123",
        todayCases: int.parse(data[2]),
        totalCases: int.parse(data[1]),
        active: int.parse(data[3]),
        newDeaths: 10,
        totalDeaths: 200,
        totalRecovered: 9000,
        critical: 5,
        testsConducted: 8000,
        isIncreasing: data[4] == "true" ? true : false

        // country: countryName,
        // code : code,
        // flagPath: 'assets/flags/'+code.toLowerCase()+'.png',
        // todayCases: data["todayCases"],
        // totalCases: data['cases'],
        // active: data["active"],
        // newDeaths: data['todayDeaths'],
        // totalDeaths: data['deaths'],
        // totalRecovered: data['recovered'],
        // critical: data["critical"],
        // testsConducted: data["tests"],
        // isIncreasing: data["todayCases"]>0? true : false
        );
  }
}
