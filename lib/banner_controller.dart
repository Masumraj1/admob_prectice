import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerController extends GetxController {
  BannerAd? _bannerAd;
  RxBool isBannerAdReady = false.obs;

  void loadBannerAd(String adUnitId) {
    // Dispose the existing banner ad if any
    _bannerAd?.dispose();

    // Initialize the new banner ad
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          isBannerAdReady.value = true;
          print('==================Banner Ad loaded: $adUnitId===================');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('======================Banner Ad failed to load:==================== $error');
          ad.dispose();
          isBannerAdReady.value = false;
        },
      ),
    );

    // Load the banner ad
    _bannerAd?.load();
  }

  BannerAd? get bannerAd => _bannerAd;

  @override
  void onClose() {
    // Dispose of the banner ad when the controller is closed
    _bannerAd?.dispose();
    super.onClose();
  }
}
