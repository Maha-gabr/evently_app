import 'package:evently_app/ui/tabs/fav_tap/fav_tap.dart';
import 'package:evently_app/ui/tabs/home_tap/home_tap.dart';
import 'package:evently_app/ui/tabs/profile_tap/profile_tab.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
class  RootScreen extends StatefulWidget {
  const  RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex= 0;
  @override
  Widget build(BuildContext context) {
    List <Widget> tabsList = [
      HomeTap(),
      FavTap(),
      ProfileTap(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: tabsList[selectedIndex]),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
          onDestinationSelected: (index){
          setState(() {
            selectedIndex = index;
          });

          },
          destinations:[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_filled),
              label: AppLocalizations.of(context)!.home
          ) ,
            NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: AppLocalizations.of(context)!.favorite
            ) ,
            NavigationDestination(
                icon: Icon(Icons.person),
                selectedIcon: Icon(Icons.home),
                label: AppLocalizations.of(context)!.profile
            ) ,
          ]

      ),
    );
  }
}
