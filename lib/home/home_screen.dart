import 'package:evently_app/home/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
class  HomeScreen extends StatelessWidget {
  const  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileTap(),
    );
  }
}
