import '/exports/exports.dart';

class AboutUac extends StatefulWidget {
  const AboutUac({super.key});

  @override
  State<AboutUac> createState() => _AboutUacState();
}

class _AboutUacState extends State<AboutUac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About UAC"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.apply(
              fontFamily: 'Montserrat',
              fontWeightDelta: 2,
            ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Hero(
                      tag: "side_image",
                      child: Image.asset(
                        "lib/images/img.png",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                  child: Text(
                    "Our Background",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontFamily: 'Montserrat',
                          fontWeightDelta: 2,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(
                      text:
                          "Uganda AIDS Commission (UAC) was set up by an Act of Parliament (Cap 208) in 1992. The Commission’s mandate is to coordinate and oversee the prevention and control of HIV and AIDS activities in Uganda. The Commission does not engage in direct implementation of interventions but takes strategic leadership in effective harmonization of action by the various players, within agreed policy and programs under thePrinciples of “Three Ones”:",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontFamily: 'Montserrat',
                          ),
                      children: [
                        TextSpan(
                          text:
                              '\n \n» One National HIV/AIDS Coordinating Authority',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                              ),
                        ),
                        TextSpan(
                          text: ' \n» One Strategic Plan',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                              ),
                        ),
                        TextSpan(
                          text: ' \n» One Monitoring and Evaluation Framework',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                              ),
                        ),
                        TextSpan(
                          text:
                              "\n\nThe Institution is composed of both the Commission (Board) and Secretariat (Management).  In 2015, Uganda AIDS Commission developed a Strategic Plan (2015/16 – 2019/20) to achieve its Vision, Mission, Goal and Objectives",
                        ),
                        TextSpan(
                          text: "\n\nOur Vision",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\nThe vision of the Commission is to be “A Population Free of HIV and Its Effects”",
                        ),
                        TextSpan(
                          text: "\n\nOur Mission",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\n\nOur mission is “ To Provide Effective Leadership to the HIV and AIDS Multi-Sectoral response ”.",
                        ),
                        TextSpan(
                          text: "\n\nOur Goal",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\nThe goal of the Commission for this Strategic Planning period is “ Effective Coordination and Management of the National Response Towards Ending AIDS in Uganda ”.",
                        ),
                        TextSpan(
                          text:
                              "\n\nStrategic Objectives \nTo realize the goal of the Strategic Plan, the Commission identified 4 areas for strategic interventions, namely:",
                        ),
                        TextSpan(
                          text:
                              "\n\n» To strengthen Governance and Management Systems \n» Resource Mobilization \n» To enhance Advocacy and Communication for the National HIV Response \n» To strengthen Strategic Information for Evidence Based Decision Making",
                        ),
                        TextSpan(
                          text: "\n\nOur Core Values",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text: "\n\nStakeholder responsiveness",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                            text:
                                "\nThe Commission undertakes to respond to stakeholder needs in real time and to proactively predict stakeholders’ expectations and devise measures to meet them.\n"),
                        TextSpan(
                          text: "\nIntegrity",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\nAs an organization, we strive to promote openness, trust, transparency, accountability and respect in all our undertakings.",
                        ),
                        TextSpan(
                          text: "\n\nPartnership",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\nCollaboration and partnership is core to the Commission’s service delivery mechanisms.  Building and strengthening partnership is not only a core value but also a mechanism to deliver services.",
                        ),
                        TextSpan(
                          text: "\n\nTeam work ",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\nWhereas the Commission cherishes and continues to reward individual merit, we believe in rallying individual efforts together in a manner that creates synergies.  Team work and team building is therefore central to the Commission’s core values.",
                        ),
                        TextSpan(
                          text: "\n\nProfessionalism",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 2,
                              ),
                        ),
                        TextSpan(
                          text:
                              "\nIn whatever the Commission does, we strive for adherence to ethical codes of conduct, exercising fairness and impartially and delivery of quality service,",
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  "\nUAC | All rights reserved | version 1.0.0",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        fontFamily: 'Montserrat',
                        fontWeightDelta: 1,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
