import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.04,vertical:height * 0.04),
      child: Column(
        spacing: height * 0.04,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppLang(themeMode: ThemeMode.light, text: AppLocalizations.of(context)!.light,),
          AppLang(themeMode: ThemeMode.dark,text: AppLocalizations.of(context)!.dark,),
        ],
      ),
    );
  }


}


class AppLang extends StatelessWidget{
  final String text;
  final ThemeMode themeMode;
  AppLang({required this.themeMode, required this.text});
  @override
  Widget build(BuildContext context) {
    AppThemeProvider appTheme = Provider.of<AppThemeProvider>(context);
    bool isSelect = appTheme.isSelected(themeMode);
    return  GestureDetector(
      onTap: (){
        appTheme.changeTheme(themeMode);
      },
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(text,style: TextStyle(fontSize: 33),),
            TextButton(onPressed: (){}, child:isSelect? Icon(Icons.check): SizedBox.shrink() ),
        ],
      ),
    );
  }

}



//  GestureDetector(
//             onTap: (){
//               appTheme.changeTheme(ThemeMode.light);
//
//             },
//             child: Row(
//               mainAxisAlignment: .spaceBetween,
//               children: [
//                 Text(AppLocalizations.of(context)!.light,style: TextStyle(fontSize: 33),),
//
//                 Icon( Icons.check)
//               ],
//             ),
//           )





/*
GestureDetector(
onTap: (){
appTheme.changeTheme(ThemeMode.dark);

},
child: Text(AppLocalizations.of(context)!.dark,style: TextStyle(fontSize: 33),))
*/