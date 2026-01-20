import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
class  HomeScreen extends StatelessWidget {
  const  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(AppLocalizations.of(context)!.language,style: TextStyle(color: Colors.black,fontSize: 33),),
    );
  }
}
