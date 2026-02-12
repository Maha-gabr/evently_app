import 'package:evently_app/extensions/context_extension.dart';
import 'package:evently_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/event_provider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    },);
  }
  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);
  Event event = Event(
      eventTime: '10:3',
      eventDate: DateTime.now(),
      eventDescription: 'Sport',
      eventImage: 'eventImage',
      eventTitle: 'sport',
      eventName: 'sport');
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
              ),
              SizedBox(height: context.height * 0.02,),
              Expanded(child:
              ListView.separated(
                  itemBuilder: (context, index) =>  EvenItem(event: event),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10,);
                  },
                  itemCount:8))
            ],
          ),
        ),
      ),
    );
  }
}
