import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:evently_app/utiles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_lang_provider.dart';
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
          Text(text,style: isSelect? AppStyles.semi20Primary:AppStyles.semi20Black,),

          TextButton(onPressed: (){}, child: isSelect ? Icon(Icons.check,size: 25,color: AppColors.mainColor ,): SizedBox.shrink() ),
        ],
      ),
    ) ;
  }

}