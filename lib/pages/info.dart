// import 'package:aids_awareness_app/utils/app_globals.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'InfoDetails.dart';
// /
// class Info extends StatefulWidget {
//   const Info({super.key});

//   _InfoState createState() => _InfoState();
// }

// class _InfoState extends State<Info> {
//   bool isLoading = true;
//   List<List<String>> collectedData = [];
//   List<dynamic> articles = [];

//   Future<void> fetchArticles() async {
//     String url = "$BASE_URL/aids_info?fields=*.*";

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         articles = data['data'];
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchArticles();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Information about HIV/AIDS",
//           ),
//         ),
//         body: Container(
//           margin: const EdgeInsets.all(10.0),
//           child: buildMain(),
//         ));
//   }

//   Widget buildMain() {
//     return isLoading
//         ? const Center(
//             child: SpinKitFadingCircle(
//               color: Colors.blue,
//               size: 30.0,
//             ),
//           )
//         : ListView.separated(
//             itemCount: articles.length,
//             separatorBuilder: (BuildContext context, int index) =>
//                 const Divider(),
//             itemBuilder: (context, index) {
//               final article = articles[index];
//               return ListTile(
//                 title: Text(
//                   article['title'],
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(
//                   article['description'],
//                   maxLines: 4,
//                   textAlign: TextAlign.justify,
//                   style: const TextStyle(
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 leading: CachedNetworkImage(
//                   imageUrl: article['photo']['data']['thumbnails'][0]['url'],
//                   placeholder: (context, url) =>
//                       const CircularProgressIndicator(),
//                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => InfoDetails(article: article),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//   }
// }
