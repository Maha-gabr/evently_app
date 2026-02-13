import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/ui/tabs/home_tap/widgets/event_item.dart';
import 'package:evently_app/ui/tabs/home_tap/widgets/lang_label.dart';
import 'package:evently_app/ui/tabs/home_tap/widgets/tap_widgets.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utiles/app_routes.dart';
class HomeTap extends StatefulWidget {
  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {


@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final eventProvider = context.read<EventProvider>();
      eventProvider.getEventNameList(context);
      eventProvider.getEventsList();
    },);
  }
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
  // eventProvider.getEventNameList(context);
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
              Text("Maha",
                style: Theme.of(context).textTheme.titleLarge,textAlign: .start,),
              SizedBox(height: context.height * 0.02,),
              DefaultTabController(
                  length:eventProvider.eventNameList.length,
                  child: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 7),
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: .start,
                    onTap: (index){
                      context.read<EventProvider>().changeIndex(index);
                      eventProvider.getEventNameList(context);
                      context.read<EventProvider>().applyFilter();
                    },
                    tabs:
                    List.generate(
                        eventProvider.eventNameList.length, (index){
                      return TapWidget(
                        isSelected: eventProvider.selectedIndex == index,
                        eventType: eventProvider.eventNameList[index],);
                    }),
                  )
              ),
              SizedBox(height: context.height * 0.02,),
              Expanded(
                  child: context.watch<EventProvider>().isLoading ?
                      Center(child: CircularProgressIndicator(color: Colors.red,))
                    :  ListView.separated(
                      itemBuilder: (context, index)
                      {
                        return GestureDetector(
                          onTap: () {
                            print("$index");
                            // eventProvider.changeIndex(index);
                            context.read<EventProvider>().applyFav(eventProvider.filterList[index]);
                          },
                          child: EvenItem(event:eventProvider.filterList[index]),);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.height * 0.021,);
                      },
                      itemCount: eventProvider.filterList.length))

            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

            Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
          },
          child: Icon(Icons.add),
        )
    );
  }

}
