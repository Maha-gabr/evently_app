import "package:evently_app/models/event.dart";
import "package:evently_app/providers/app_theme_provider.dart";
import "package:evently_app/providers/event_provider.dart";
import "package:evently_app/ui/add_event_screen/widgets/custom_text_field.dart";
import "package:evently_app/ui/add_event_screen/widgets/event_date_or_time.dart";
import "package:evently_app/utiles/app_assets.dart";
import "package:evently_app/utiles/firebase_utils.dart";
import"package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";
import "../../extensions/context_extension.dart";
import "../../l10n/app_localizations.dart";
import "../tabs/home_tap/widgets/tap_widgets.dart";
    class AddEventScreen extends StatefulWidget {
       AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}
class _AddEventScreenState extends State<AddEventScreen> {
      // int selectedIndex =0;
      String title ='';
      String description = '';
      DateTime? selectedDate ;
      TimeOfDay? selectedTime ;
      String timeFormate ='';
      String dateFormate ='';
     List<String> eventImagesLightList =[];
     List<String> eventImagesDarkList=[];
      late EventProvider eventProvider ;
      late List<String> eventNamesList;
    var formKey = GlobalKey<FormState>();
@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventProvider.getEventNameList(context);

    },);
  }
      @override
      Widget build(BuildContext context) {
        eventProvider = Provider.of<EventProvider>(context);
        eventNamesList = eventProvider.eventNameList.sublist(1);
        AppThemeProvider appTheme =Provider.of<AppThemeProvider>(context);
        eventImagesLightList= [
          AppAssets.sport,
          AppAssets.birthday,
          AppAssets.exhibtion,
          AppAssets.bookClub,
          AppAssets.meeting,
        ];
        eventImagesDarkList= [
          AppAssets.darkSport,
          AppAssets.darkBirthday,
          AppAssets.darkExhipition,
          AppAssets.darkBookClub,
          AppAssets.darkMeeting,
        ];
        String selectedImage =appTheme.isDark()
            ? eventImagesDarkList[eventProvider.selectedIndex]
            : eventImagesLightList[eventProvider.selectedIndex];
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: context.width * 0.04,vertical: context.width * 0.02),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(crossAxisAlignment: .start,
                    spacing: context.height * 0.02,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(8),
                                border: BoxBorder.all(
                                    color: Theme.of(context).colorScheme.surface,
                                    width: 2
                                ),
                                color: Theme.of(context).colorScheme.onPrimary
                            ),
                            child: IconButton(icon:Icon(Icons.arrow_back_ios_new_outlined,size: 22,),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              color: Theme.of(context).colorScheme.tertiary,),
                          ),
                          Spacer(),
                          Text(AppLocalizations.of(context)!.add_event,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Spacer(),
                        ],
                      ),
                      Column(
                        spacing: context.height * 0.02,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(18),
                                  border: Border.all(
                                      color: Theme.of(context).colorScheme.surface,
                                      width: 2
                                  )
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                  selectedImage
                              )
                          ),
                          SizedBox(
                              height: context.height * 0.06,
                              child: ListView.separated(
                                itemCount:eventNamesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: (){
                                         eventProvider.changeIndex(index);
                                         /*
                                         setState(() {
                                           selectedIndex = index;
                                         });
                                         */
                                      },
                                      child: TapWidget(
                                        isSelected:eventProvider.selectedIndex == index,
                                        eventType: eventNamesList[index],
                                      )
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: context.width * 0.02,);
                                },
                              )
                          )
                        ],
                      ),

                      Text(AppLocalizations.of(context)!.title,
                        style: Theme.of(context).textTheme.titleLarge,),
                      CustomTextField(
                          onValidate: (text){
                            if(text == null || text.trim().isEmpty){
                              return 'Please Enter Event Title';
                            }return null;
                          },
                          onChanged: (text){
                            title = text;
                            setState(() {

                            });
                          },
                          hintText: AppLocalizations.of(context)!.event_title
                      ),
                      Text(AppLocalizations.of(context)!.description,
                        style: Theme.of(context).textTheme.titleLarge,),
                      CustomTextField(
                          onValidate: (text){
                            if(text == null || text.trim().isEmpty){
                              return 'Please Enter Event Description';
                            }return null;
                          },
                          maxLines: 4,
                          onChanged: (text){
                            description = text;
                            setState(() {

                            });
                          },
                          hintText: AppLocalizations.of(context)!.event_description),
                      EventDateOrTime(
                        iconDateOrTime: Icon(Icons.date_range,color:Theme.of(context).colorScheme.tertiary,),
                        eventDateOrTime: AppLocalizations.of(context)!.event_date,
                        chooseDateOrTime:selectedDate == null? AppLocalizations.of(context)!.choose_date : dateFormate,
                        onChooseDateOrTime: onChooseDate,),
                      // SizedBox(height: context.height * 0.001,),
                      EventDateOrTime(
                        iconDateOrTime: Icon(Icons.access_time_rounded,color:Theme.of(context).colorScheme.tertiary,),
                        eventDateOrTime:
                        AppLocalizations.of(context)!.event_time
                        ,
                        chooseDateOrTime:selectedTime == null
                            ?AppLocalizations.of(context)!.choose_time
                            :timeFormate
                        ,
                        onChooseDateOrTime: onChooseTime,),
                      SizedBox(height: context.height * 0.001,),
                      ElevatedButton(
                          onPressed: (){
                            Event event = Event(
                                eventTime: timeFormate,
                                eventDate: selectedDate!,
                                eventDescription: description,
                                eventImage: selectedImage,
                                eventTitle: title,
                                eventName: eventNamesList[eventProvider.selectedIndex]
                            );
                              FirebaseUtils.addEventToFireStore(event);
                              Navigator.pop(context);
                          },
                          child: Text(AppLocalizations.of(context)!.add_event)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      }

       void onChooseDate() async {
         DateTime? chooseDate =await showDatePicker(
             context: context,
             initialDate: DateTime.now(),
             firstDate: DateTime.now(),
             lastDate: DateTime.now().add(Duration(days: 365))
         );
         selectedDate = chooseDate;
         if(selectedDate != null){
           dateFormate = DateFormat('MMM d, yyyy').format(selectedDate!);

         }
        setState(() {

        });

       }

       Future<void> onChooseTime()async{
         TimeOfDay? chooseTime=await showTimePicker(
             context: context,
             initialTime: TimeOfDay.now()
         );
         selectedTime =chooseTime;

         if(selectedTime != null){
           timeFormate = selectedTime!.format(context);
         }
         setState(() {

         });
       }
}
