import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/tabs/home_tap/widgets/lang_label.dart';
import 'package:evently_app/ui/tabs/home_tap/widgets/tap_widgets.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeTap extends StatefulWidget {
  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {

  List <String> eventNameList =[];
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
     eventNameList =[
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.work_shop,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.meeting
    ];
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: context.height * 0.02,),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.welcome_back,style: Theme.of(context).textTheme.headlineMedium,)
                  ,Spacer(),
                  IconButton(
                      onPressed: (){
                      },
                      icon:themeProvider.isDark()
                          ? Icon(Icons.mode_night_outlined,size: 24,color: AppColors.mainDarkColor,)
                          : Icon(Icons.light_mode_outlined,size: 24,color: AppColors.mainColor,)
                  ),
                  LangLabel(),
                ],
              ),
              Text("maha",
                style: Theme.of(context).textTheme.titleLarge,textAlign: .start,),
              SizedBox(height: context.height * 0.02,),
              DefaultTabController(
                  length:eventNameList.length,
                  child: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 7),
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: .start,
                    onTap: (index){
                      selectedIndex = index;
                      setState(() {

                      });
                    },
                    tabs:
                    List.generate(
                       eventNameList.length, (index){
                      return TapWidget(
                        isSelected: selectedIndex == index,
                        eventType: eventNameList[index],);
                    }),
                  )
              ),
              SizedBox(height: context.height * 0.02,),
              Expanded(
                  child:
                      ListView.separated(
                      itemBuilder: (context, index)
                      {
                        return GestureDetector(
                          onTap: () {

                          },
                          //event item
                          child: Container(color: AppColors.mainColor,child: Text('event'),),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.height * 0.021,);
                      },
                      itemCount: 10))

            ],
          ),
        ),
      ),
    );
  }

}
