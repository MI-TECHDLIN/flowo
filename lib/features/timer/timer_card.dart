//this is inspred by a tutorial of mitch koko on time picker i imporovised a little

//TODO: later on development get a better time picker widget  for time
import 'package:flutter/material.dart';

class TimerCard extends StatefulWidget {
  const TimerCard({super.key});

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  TimeOfDay? _timeoofday = TimeOfDay(hour: 8, minute: 30);
  void _showtimepicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((
      value,
    ) {
      setState(() {
        _timeoofday = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: _showtimepicker,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Pick time'),
              ),
            ),

            Text(_timeoofday!.format(context).toString()),
          ],
        ),
      ),
    );
  }
}
