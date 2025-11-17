import '../../controllers/national_prevalence_controller.dart';
import '../../services/hiv_burden_service.dart';
import '../../models/plhiv_prevalence.dart';
import '../../models/new_number_of_infection_model.dart';
import '../../models/annual_aids_response.dart';
import '/exports/exports.dart';

class HivAidsBurden extends StatefulWidget {
  const HivAidsBurden({super.key});

  @override
  State<HivAidsBurden> createState() => _HivAidsBurdenState();
}

class _HivAidsBurdenState extends State<HivAidsBurden> {
  final HivBurdenService _hivBurdenService = HivBurdenService();

  List<Plhiv> plhivData = [];
  List<NewNumberOfInfections> newInfectionsData = [];
  List<AnnualAids> annualAidsData = [];

  bool isLoadingPlhiv = true;
  bool isLoadingInfections = true;
  bool isLoadingAids = true;

  @override
  void initState() {
    super.initState();
    _fetchAllData();
  }

  Future<void> _fetchAllData() async {
    await Future.wait([
      _fetchPlhivData(),
      _fetchNewInfections(),
      _fetchAnnualAids(),
    ]);
  }

  Future<void> _fetchPlhivData() async {
    try {
      final data = await _hivBurdenService.getPlhivPrevalence();
      if (mounted) {
        setState(() {
          plhivData = data;
          isLoadingPlhiv = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoadingPlhiv = false;
        });
      }
      print('Error fetching PLHIV data: $e');
    }
  }

  Future<void> _fetchNewInfections() async {
    try {
      final data = await _hivBurdenService.getNewInfectionsBySubRegion();
      if (mounted) {
        setState(() {
          newInfectionsData = data;
          isLoadingInfections = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoadingInfections = false;
        });
      }
      print('Error fetching new infections data: $e');
    }
  }

  Future<void> _fetchAnnualAids() async {
    try {
      final data = await _hivBurdenService.getAnnualNewInfections();
      if (mounted) {
        setState(() {
          annualAidsData = data;
          isLoadingAids = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoadingAids = false;
        });
      }
      print('Error fetching annual AIDS data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 15, 5),
            child: Text(
              "2023",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 2,
                fontSizeFactor: 0.84,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: Text(
          "HIV / AIDS Burden",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
            fontWeightDelta: 2,
            fontSizeFactor: 1.4,
            color: Colors.white,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight * 0.048,
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              ListView(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                children: [
                  Space(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Number of PLHIV Disaggregated by Age Group & Sex",
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(fontWeightDelta: 3),
                    ),
                  ),
                  isLoadingPlhiv
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : plhivData.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'No data available',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                      : DataTable(
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          columnSpacing: 20,
                          horizontalMargin: 12,
                          columns: [
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Population Group',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(fontWeightDelta: 3),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Year (2023)',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(fontWeightDelta: 3),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                          rows: plhivData.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    item.attributes.populationGroup,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(fontFamily: 'Montserrat'),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item.attributes.valueByYear,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(fontFamily: 'Montserrat'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                  //
                  Space(space: 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'National HIV Prevalence',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(fontWeightDelta: 3),
                    ),
                  ),
                  Consumer<NationalPrevalenceController>(
                    builder: (context, nController, x) {
                      if (mounted) {
                        nController.fetchNationalPrevalence();
                      }
                      return nController.items.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : DataTable(
                              border: TableBorder.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              columnSpacing: 20,
                              horizontalMargin: 12,
                              columns: [
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'Population Group',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(fontWeightDelta: 3),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'Year (2023)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(fontWeightDelta: 3),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                              rows: List.generate(nController.items.length, (
                                i,
                              ) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        nController.items[i].attributes.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .apply(fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "${nController.items[i].attributes.value}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .apply(fontFamily: 'Montserrat'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                    },
                  ),
                  Space(space: 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Number of New Infections by Age Group and Sex',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(fontWeightDelta: 3),
                    ),
                  ),
                  isLoadingInfections
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : newInfectionsData.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'No data available',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                      : DataTable(
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          columnSpacing: 20,
                          horizontalMargin: 12,
                          columns: [
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Population Group',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(fontWeightDelta: 3),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Year (2023)',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(fontWeightDelta: 3),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                          rows: newInfectionsData.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    item.attributes.populationGroup,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(fontFamily: 'Montserrat'),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item.attributes.year,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(fontFamily: 'Montserrat'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                  Space(space: 0.05),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Annual AIDS Related Deaths by Sex and Age Group',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(fontWeightDelta: 3),
                    ),
                  ),
                  isLoadingAids
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : annualAidsData.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'No data available',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                      : DataTable(
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          columnSpacing: 20,
                          horizontalMargin: 12,
                          columns: [
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Population Group',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(fontWeightDelta: 3),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Year (2023)',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(fontWeightDelta: 3),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                          rows: annualAidsData.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    item.attributes.populationGroup,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(fontFamily: 'Montserrat'),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item.attributes.valueByYear,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(fontFamily: 'Montserrat'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                  Space(space: 0.4),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
