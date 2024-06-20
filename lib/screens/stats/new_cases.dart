import '/exports/exports.dart';

class NewCasesPage extends StatefulWidget {
  const NewCasesPage({super.key});

  @override
  State<NewCasesPage> createState() => _NewCasesPageState();
}

class _NewCasesPageState extends State<NewCasesPage> {
  String year = "2010";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 15, 5),
            child: Text(
              "2023",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 2,
                    fontSizeFactor: 0.84,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
            ),
          ),
        ],
        title: Text(
          "HIV AIDS Burden",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 2,
                fontSizeFactor: 1.4,
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
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
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              children: [
                Space(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "\n Number of PLHIV Disaggregated by Age Group & Sex",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 3,
                            fontFamily: 'Montserrat',
                          )),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Population Group',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontWeightDelta: 3,
                                fontFamily: 'Montserrat',
                              ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Year (2023)',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontWeightDelta: 3,
                                fontFamily: 'Montserrat',
                              ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Adults & Children')),
                        DataCell(Text('1,500,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adults 15+')),
                        DataCell(Text('1,400,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Women 15+')),
                        DataCell(Text('910,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Men 15+')),
                        DataCell(Text('490,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('All Young people 15-24')),
                        DataCell(Text('150,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Young Men 15-24')),
                        DataCell(Text('40,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Young Women 15-24')),
                        DataCell(Text('110,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('All Adolescent 10-19')),
                        DataCell(Text('85,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adolescent Women 10-19')),
                        DataCell(Text('51,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adolescent Men 10-19')),
                        DataCell(Text('34,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Children 0-14')),
                        DataCell(Text('72,000')),
                      ]),
                    ],
                  ),
                ),
                //
                Space(
                  space: 0.05,
                ),
                Text(
                  'Number of New Infections by Age Group and Sex',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 3,
                        fontFamily: 'Montserrat',
                      ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Population Group',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontWeightDelta: 3,
                                fontFamily: 'Montserrat',
                              ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Year (2023)',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontWeightDelta: 3,
                                fontFamily: 'Montserrat',
                              ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Adults & Children')),
                        DataCell(Text('38,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adults 15+')),
                        DataCell(Text('33,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Women 15+')),
                        DataCell(Text('22,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Men 15+')),
                        DataCell(Text('11,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('All Young people 15-24')),
                        DataCell(Text('15,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Young Men 15-24')),
                        DataCell(Text('3,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Young Women 15-24')),
                        DataCell(Text('12,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('All Adolescent 10-19')),
                        DataCell(Text('6,600')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adolescent Women 10-19')),
                        DataCell(Text('5,900')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adolescent Men 10-19')),
                        DataCell(Text('700')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Children 0-14')),
                        DataCell(Text('4,700')),
                      ]),
                    ],
                  ),
                ),
                Space(
                  space: 0.05,
                ),
                //
                Text(
                  'Annual AIDS Related Deaths by Sex and Age Group\n',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 3,
                        fontFamily: 'Montserrat',
                      ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Population Group',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontWeightDelta: 3,
                                fontFamily: 'Montserrat',
                              ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Year (2023)',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontWeightDelta: 3,
                                fontFamily: 'Montserrat',
                              ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Adults & Children')),
                        DataCell(Text('20,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adults 15+')),
                        DataCell(Text('17,000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Women 15+')),
                        DataCell(Text('8,200')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Men 15+')),
                        DataCell(Text('7,800')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('All Young people 15-24')),
                        DataCell(Text('1,900')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Young Men 15-24')),
                        DataCell(Text('800')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Young Women 15-24')),
                        DataCell(Text('1,100')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('All Adolescent 10-19')),
                        DataCell(Text('1,100')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adolescent Women 10-19')),
                        DataCell(Text('560')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Adolescent Men 10-19')),
                        DataCell(Text('550')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Children 0-14')),
                        DataCell(Text('3,200')),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
