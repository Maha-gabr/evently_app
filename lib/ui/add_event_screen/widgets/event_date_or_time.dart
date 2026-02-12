
import 'package:evently_app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
typedef OnChooseDateOrTime =void Function();
class EventDateOrTime extends StatelessWidget {
  final Widget iconDateOrTime;
  final String eventDateOrTime;
  final String chooseDateOrTime;
  final OnChooseDateOrTime onChooseDateOrTime;

  const EventDateOrTime({super.key, required this.iconDateOrTime, required this.eventDateOrTime, required this.chooseDateOrTime, required this.onChooseDateOrTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconDateOrTime,
        SizedBox(width: context.width * 0.01,),
        Text(eventDateOrTime,
            style: Theme.of(context).textTheme.headlineSmall),
        Expanded(child: GestureDetector(
          onTap:onChooseDateOrTime
          ,
          child: Text(
            textAlign: .end,
            chooseDateOrTime,style: Theme.of(context).textTheme.bodySmall,
          ),
        ))
      ],
    );
  }
}
