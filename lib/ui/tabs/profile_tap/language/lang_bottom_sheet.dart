import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utiles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_lang_provider.dart';

class LangBottomSheet extends StatelessWidget {
   LangBottomSheet({super.key});

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
          AppLang(text: AppLocalizations.of(context)!.arabic, lang: 'ar',),
          AppLang(text: AppLocalizations.of(context)!.english, lang: 'en',)
        ],
      ),
    );
  }
}

class AppLang extends StatelessWidget{
  final String text;
  final String lang;

  AppLang({required this.text, required this.lang});
  @override
  Widget build(BuildContext context) {
    var appLang = Provider.of<AppLangProvider>(context);
    bool isSelect = appLang.isSelected(lang);
    return   GestureDetector(
      onTap: (){
        appLang.changLang(lang);

      },
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(text,style: isSelect? Theme.of(context).textTheme.labelLarge:AppStyles.semi20Black,),
          IconButton(
              onPressed: (){},
              icon: isSelect ? Icon(Icons.check,size: 25,color: Theme.of(context).colorScheme.onSecondary ,): SizedBox.shrink()
          )
        ],
      ),
    ) ;
  }

}