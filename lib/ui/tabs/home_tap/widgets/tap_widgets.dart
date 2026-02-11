import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
class TapWidget extends StatelessWidget {
  final bool isSelected;
  final String eventType;
  const TapWidget({super.key, required this.isSelected, required this.eventType});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsetsGeometry.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          color:isSelected? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer
          ,
          borderRadius: BorderRadiusGeometry.circular(16),
          border: BoxBorder.all(
              color: !isSelected && themeProvider.isDark() ? AppColors.strokeDarkColor : Colors.transparent ,
              width: 2
          )
      ),
      child: Row(
        spacing: context.width * 0.01,
        children: [
          // Icon(icon as IconData?,size: 25,
          //   color: isSelected ?Theme.of(context).colorScheme.secondary :Theme.of(context).colorScheme.primary,),
          Text(eventType,style: isSelected ? Theme.of(context).textTheme.titleSmall: Theme.of(context).textTheme.headlineSmall ,),
        ],
      ),
    );
  }
}
