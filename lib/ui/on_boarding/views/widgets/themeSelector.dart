import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';

class  Themeselector extends StatefulWidget {
  @override
  State<Themeselector> createState() => _LangSelectorState();
}

class _LangSelectorState extends State<Themeselector> {
  int selectedIndex = 0 ;
  Widget build(BuildContext context) {

    return Row(
      children:
      List.generate(2, (index) {
        List<Icon> themeIcons =[
          Icon(Icons.light_mode,color:selectedIndex != index && !Provider.of<AppThemeProvider>(context).isDark()?AppColors.mainColor:AppColors.whiteColor ,)
          ,Icon(Icons.dark_mode_outlined,color:selectedIndex != index && !Provider.of<AppThemeProvider>(context).isDark()?AppColors.mainColor:AppColors.whiteColor )
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:selectedIndex == index?  Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onPrimary,
              borderRadius:BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: (){
                selectedIndex = index;
                setState(() {
                });

              },
              child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 15,vertical: 8),
                  child: SizedBox(child: themeIcons[index],),
            ),

          ),
        )


        ); },).toList(),
    );
  }
}
