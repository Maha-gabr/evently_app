import 'package:evently_app/utiles/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

class OnBoardingModel {
  String imagePath;
  String title;

  String description;

  OnBoardingModel({
    required this.imagePath,
    required this.description,
    required this.title
  });


 static List<OnBoardingModel> getOnBoardingModelList(BuildContext context) {
   final bool isDark = Provider.of<AppThemeProvider>(context).isDark();

    return [
      OnBoardingModel(
          imagePath: isDark ?AppAssets.onBoardingDark1 :AppAssets.onBoardingImage1, description: 'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.', title: 'Personalize Your Experience'),
    OnBoardingModel(imagePath: isDark ?AppAssets.onBoardingDark2 :AppAssets.onBoardingImage2, description: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.", title: 'Find Events That Inspire You'),
   OnBoardingModel(imagePath: isDark ?AppAssets.onBoardingDark3 :AppAssets.onBoardingImage3, description: 'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.', title: 'Effortless Event Planning'),
      OnBoardingModel(imagePath: isDark ?AppAssets.onBoardingDark4 :AppAssets.onBoardingImage4, description: 'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.', title: 'Connect with Friends & Share Moments')
   
    ];
    
  }

}