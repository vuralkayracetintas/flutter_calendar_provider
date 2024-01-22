// import 'package:demo_apps/admob/ad_function.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class GoogleAdMobTest extends StatelessWidget {
//   const GoogleAdMobTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GoogleAdsFunction googleAds = Get.put(GoogleAdsFunction());
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             Text('asdasdasdad'),
//             if (googleAds.bannerAd != null)
//               Container(
//                 width: googleAds.bannerAd!.size.width.toDouble(),
//                 height: googleAds.bannerAd!.size.height.toDouble(),
//                 child: AdWidget(ad: googleAds.bannerAd!),
//               )
//             else
//               Container(
//                 width: 50,
//                 height: 200,
//                 color: Colors.red,
//               ),
//             if (googleAds.bannerAd2 != null)
//               SizedBox(
//                 width: googleAds.bannerAd2!.size.width.toDouble(),
//                 height: googleAds.bannerAd2!.size.height.toDouble(),
//                 child: AdWidget(ad: googleAds.bannerAd2!),
//               )
//             else
//               Container(
//                 width: 50,
//                 height: 200,
//                 color: Colors.red,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
