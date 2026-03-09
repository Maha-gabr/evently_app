import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/utiles/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/event_provider.dart';
import '../../../providers/userProvider.dart';
import '../home_tap/widgets/event_item.dart';
class FavoriteTap extends StatefulWidget {
  const FavoriteTap({super.key});

  @override
  State<FavoriteTap> createState() => _FavoriteTapState();
}

class _FavoriteTapState extends State<FavoriteTap> {
  late EventProvider eventProvider;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10,),
          child: Column(
            children: [
              SizedBox(height: context.height * 0.03,),
              TextField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.search_for_event,
                    suffixIcon: Icon(Icons.search)
                ),
                onChanged: (value){
                  eventProvider.applySearch(value);
                },
              ),
              SizedBox(height: context.height * 0.02,),
              Expanded(child:
                Center(child:
                eventProvider.favList.isEmpty
                ?Text(AppLocalizations.of(context)!.no_fav_event_yet,style: Theme.of(context).textTheme.headlineMedium,)
              :ListView.separated(
                  itemBuilder: (context, index) =>  GestureDetector(
                      onTap:() async {
                        await  context.read<EventProvider>().applyFav(
                          eventProvider.favList[index],
                          Provider.of<Userprovider>(context,listen: false).myUser?.id??"",
                        );
                        },
                      child: EvenItem(
                        event: eventProvider.favList[index],
                        onDelete:() async {
                          await context.read<EventProvider>().deleteEvent(eventProvider.filterList[index],
                              Provider.of<Userprovider>(context,listen: false).myUser!
                          );
                          AppToast.appToast(text: 'Event Deleted Successfully');

                        },
                        onUpdate: (){

                        },
                      )),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10,);
                  },
                  itemCount:eventProvider.favList.length  )
                )
    )
            ],
          ),
        ),
      ),
    );
  }
}
