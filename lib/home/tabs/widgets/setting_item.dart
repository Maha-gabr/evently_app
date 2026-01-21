import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../extensions/context_extension.dart';
class SettingItem extends StatelessWidget {
  final String text;
  final Widget item;
  const SettingItem({super.key, required this.text, required this.item});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: context.width * 0.04,vertical: context.height* 0.01),
      decoration: BoxDecoration(
      borderRadius: BorderRadiusGeometry.circular(16),
        color: themeProvider.isDark()?Colors.transparent:AppColors.strokeWhiteColor,
        border: Border.all(width: 2,
            color:themeProvider.isDark()?AppColors.strokeDarkColor:AppColors.lightGreyColor )
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(text,style: Theme.of(context).textTheme.headlineSmall,),
      item,
        ],
      ),
    );
  }
}
