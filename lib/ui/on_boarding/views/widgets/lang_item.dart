import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/ui/on_boarding/views/widgets/themeSelector.dart';
import 'package:flutter/material.dart';
import 'langSelector.dart';
class LangItem extends StatelessWidget {
final bool isThemeSelector ;
final bool isLangSelector ;

   const LangItem.LangTemeItem({super.key,  this.isThemeSelector= false, this.isLangSelector= false,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(isThemeSelector?AppLocalizations.of(context)!.theme:AppLocalizations.of(context)!.language,style:  Theme.of(context).textTheme.displayMedium,),
        Spacer(),
        isLangSelector?
        LangSelector()
        :SizedBox.shrink(),
        isThemeSelector?
        Themeselector()
            :SizedBox.shrink()


      ],
    );
  }
}