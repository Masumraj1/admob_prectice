import 'package:admob_add/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerScreen extends StatelessWidget {
  final BannerController bannerAdController = Get.put(BannerController());

   BannerScreen({super.key});

  // Method to load a specific ad
  void loadAd(String adUnitId) {
    bannerAdController.loadBannerAd(adUnitId);
  }

  @override
  Widget build(BuildContext context) {
    loadAd('ca-app-pub-3940256099942544/6300978111'); // Test Ad Unit ID 1


    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ad'),
      ),
      body: Obx(
            () {
          // Check if the banner ad is ready
          if (bannerAdController.isBannerAdReady.value && bannerAdController.bannerAd != null) {
            // Print success message when the ad is displayed
            Future.delayed(Duration.zero, () {
              print('=====================Banner Ad displayed successfully.=======================');
            });

            // Display the banner ad
            return Padding(
              padding: const EdgeInsets.all(15),
              child:
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: bannerAdController.bannerAd!.size.width.toDouble(),
                    height: bannerAdController.bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: bannerAdController.bannerAd!),
                  ),
                ],
              ),
            );
          } else {
            // Return an empty widget when the ad is not ready
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
