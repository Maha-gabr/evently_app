import 'package:evently_app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../models/event.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../utiles/app_colors.dart';
class EvenItem extends StatelessWidget {
  final Event event ;
  final Function onDelete ;
  final Function onUpdate;
  const EvenItem({super.key,required this.event, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);


    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 5),
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 8),
      height: context.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(16),
          border: BoxBorder.all(
              color: themeProvider.isDark()? AppColors.strokeDarkColor :AppColors.whiteColor,
              width: 1
          ),
          image: DecorationImage(image: AssetImage(event.eventImage,),fit: BoxFit.cover)
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: EdgeInsetsGeometry.symmetric(vertical: 8,horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(16),
              color: Theme.of(context).colorScheme.onPrimary,
              border: BoxBorder.all(
                  width: 2,
                  color: themeProvider.isDark() ? AppColors.strokeDarkColor : AppColors.strokeWhiteColor
              ),
            ),
            // child: Text("${event.eventDate}", style:  Theme.of(context).textTheme.labelMedium,),),

            child: Text(DateFormat('d MMM').format(event.eventDate), style:  Theme.of(context).textTheme.labelMedium,),),
          Spacer(),
          Container(
            height:height * 0.07 ,
            padding: EdgeInsetsGeometry.symmetric(vertical: 7,horizontal: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(16),
              color: Theme.of(context).colorScheme.onPrimary,
              border: BoxBorder.all(
                  width: 2,
                  color: themeProvider.isDark() ? AppColors.strokeDarkColor : AppColors.strokeWhiteColor
              ),
            ),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Text(event.eventTitle, style:  Theme.of(context).textTheme.titleMedium),
                Spacer(),
                IconButton(
                  onPressed: (){
                  },
                  icon:Icon(event.isFav ?Icons.favorite : Icons.favorite_border, size: 25,),
                  color: Theme.of(context).colorScheme.primary, ),
                PopupMenuButton<String>(
                  color:Theme.of(context).colorScheme.onPrimary ,
                  borderRadius: BorderRadius.circular(22),
                  shape: Border.all(
                      color:themeProvider.isDark() ? AppColors.strokeDarkColor : AppColors.strokeWhiteColor,
                  ),
                  constraints: BoxConstraints(maxWidth: context.width * 0.4),
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'delete') {
                      // delete function
                    onDelete();
                    } else if (value == 'update') {
                      // update function
                    onUpdate();
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'update',
                      child: Row(
                        children: [
                          const Icon(Icons.edit, color: Colors.blue),
                          const SizedBox(width: 10),
                          Text("Update",style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(Icons.delete, color: Colors.red),
                          const SizedBox(width: 10),
                          Text("Delete",style:Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
