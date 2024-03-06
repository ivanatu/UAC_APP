// import 'package:flutter/material.dart';
// import 'Info.dart';
// import 'video.dart';
// import 'stats.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HIV/AIDS Awareness'),
//           leading: const Icon(
//             Icons.escalator_warning,
//             // color: Colors.white,
//             size: 40.0,
//             textDirection: TextDirection.ltr,
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               Card(
//                 color: const Color(0xffECEFF1),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const ListTile(
//                         leading: Icon(
//                           Icons.book,
//                           size: 40,
//                           color: Colors.blueGrey,
//                         ),
//                         title: Text(
//                           'Information about HIV/AIDS',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           'Be informed about HIV/AIDS, get expert info and equipped yourself.',
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           ElevatedButton(
//                             child: const Text('GET MORE INFO'),
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => const Info()));
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Card(
//                 color: const Color(0xffECEFF1),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const ListTile(
//                         leading: Icon(
//                           Icons.video_camera_back_outlined,
//                           size: 40,
//                           color: Colors.blueGrey,
//                         ),
//                         title: Text(
//                           'Informative Videos about HIV/AIDS',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           'Watch expert advise and videos about HIV/AIDS, What you need to know about HIV.',
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           ElevatedButton(
//                             child: const Text('WATCH VIDEOS'),
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => const Video()));
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Card(
//                 color: const Color(0xffECEFF1),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const ListTile(
//                         leading: Icon(
//                           Icons.book,
//                           size: 40,
//                           color: Colors.blueGrey,
//                         ),
//                         title: Text(
//                           'Statistics about HIV/AIDS',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           'Be informed about HIV/AIDS, get expert info and equipped yourselfView the current accurate Statistics about HIV/AIDs.',
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           ElevatedButton(
//                             child: const Text('VIEW STATS'),
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => const Stats()));
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Spacer(),
//               const Text(
//                 "Uganda AIDS Commission - 2023",
//                 style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueGrey,
//                   letterSpacing: 1.5,
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
