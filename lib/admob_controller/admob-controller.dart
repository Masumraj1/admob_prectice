
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobController extends GetxController with GetxServiceMixin {
  List<BannerAd> bannerAds = [];

  ///=============== Generated 20 Banner Ads ==============

  loadMultipleBannerAds() {
    for (int i = 0; i < 20; i++) {
      // Load 10 banner ads, adjust as needed
      BannerAd bannerAdd = BannerAd(
        adUnitId: 'ca-app-pub-2906458878144502/5816785841',
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (_) {},
          onAdFailedToLoad: (_, error) {
            debugPrint('Ad failed to load: $error');
          },
        ),
      )..load();
      bannerAds.add(bannerAdd); // Add the loaded banner ad to the list
    }
  }



  @override
  void onInit() {
    loadMultipleBannerAds();
    super.onInit();
  }
}
