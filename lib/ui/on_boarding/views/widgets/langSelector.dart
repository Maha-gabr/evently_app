import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
class  LangSelector extends StatefulWidget {
  @override
  State<LangSelector> createState() => _LangSelectorState();
}

class _LangSelectorState extends State<LangSelector> {
  int selectedIndex = 0 ;
  Widget build(BuildContext context) {
    List<String> langList =[
      AppLocalizations.of(context)!.english ,AppLocalizations.of(context)!.arabic
    ];
    return Row(
      children:
      List.generate(2, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:selectedIndex == index?  Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: (){
                selectedIndex = index;
                setState(() {
                });

              },
              child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Text(langList[index],style: selectedIndex == index?Theme.of(context).textTheme.titleSmall :Theme.of(context).textTheme.displayMedium)),
            ),

          ),
        );

      },).toList(),
    );
  }
}
