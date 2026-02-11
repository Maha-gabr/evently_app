import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/ui/tabs/profile_tap/theme/theme_bottom_sheet.dart';
import 'package:evently_app/ui/tabs/profile_tap/widgets/setting_item.dart';
import 'package:evently_app/utiles/app_assets.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import 'language/lang_bottom_sheet.dart';
class ProfileTap extends StatefulWidget {
   ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: context.width *0.06,vertical:  context.height * 0.04),
        child: Column(
          spacing: context.height * 0.02,
            children: [
            Image.asset(AppAssets.routeLogo),
              Text('Route Acdemy',style: Theme.of(context).textTheme.headlineLarge,),
              Text('roureacademy@gmail.com',style: Theme.of(context).textTheme.headlineMedium,),

              SettingItem(text: AppLocalizations.of(context)!.dark_mode,
              item: Switch(
                onChanged: (value) {
                    isSelected = value;
                    if(value){
                      themeProvider.changeTheme(ThemeMode.dark);
                    }else{
                      themeProvider.changeTheme(ThemeMode.light);
                    }
                      setState(() {

                      });
                },
                value:isSelected ,
              ),
              ),
              SettingItem(text: AppLocalizations.of(context)!.language,
                item:IconButton(
                  onPressed: (){
                    showLangBottomSheet();
                  },
                icon: Icon(Icons.arrow_back_ios_new_outlined,size: 30,)  ,
                color: themeProvider.isDark()? AppColors.mainDarkColor:AppColors.mainColor,
                ),
              ),
              SettingItem(text: AppLocalizations.of(context)!.logout,
                item:IconButton(
                  onPressed: (){

                  },
                 icon: Icon(Icons.logout,size: 30,) ,
                  color: AppColors.redColor,
                ),
              ),

////////////////////////////////////////


            ],
          ),
      ),
    );

  }

  void showLangBottomSheet(){
    showModalBottomSheet(context: context,
        constraints: BoxConstraints(maxHeight: context.height * 0.33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
        builder: (context) {
      return LangBottomSheet();
        },
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}


