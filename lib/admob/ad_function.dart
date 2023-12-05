// void loadInterstitalAds() {
//   InterstitialAd.load(
//       adUnitId: AdmobExtension.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         // Called when an ad is successfully received.
//         onAdLoaded: (ad) {
//           debugPrint('$ad loaded.');
//           // Keep a reference to the ad so you can show it later.
//           interstitialAd = ad;
//         },
//         // Called when an ad request failed.
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint('InterstitialAd failed to load: $error');
//         },
//       ));
// }

import 'package:demo_apps/admob/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsFunction extends GetxController {
  BannerAd? bannerAd;
  BannerAd? bannerAd2;

  void loadBanner() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitID1,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          debugPrint('$ad loaded.');
          update();
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadBanner2() {
    bannerAd2 = BannerAd(
      adUnitId: AdHelper.bannerAdUnitID2,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad2) {
          bannerAd2 = ad2 as BannerAd;
          debugPrint('$ad2 2loaded.');
          update();
        },
        onAdFailedToLoad: (ad2, err) {
          debugPrint('BannerAd 2 failed to load: $err');
          ad2.dispose();
        },
      ),
    )..load();
  }

  void loadAds() {
    loadBanner();
    loadBanner2();
  }

  @override
  void onInit() {
    super.onInit();
    loadAds();
  }
}
