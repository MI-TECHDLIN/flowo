import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color prioritybordercolor(int inactive) {
  return Color(inactive);
}

Color prioritytexttextcolor(int inactive) {
  return Color(inactive);
}

Color prioritybackgroundcolor(int inactive) {
  return Color(inactive);
}

const TimeOfDay consttime = TimeOfDay(hour: 10, minute: 10);

Color prioritypointercolor(int inactive) {
  return Color(inactive);
}

Widget whitetext(String text, double fontsize, {int color = 0xffFFFFFFF}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontsize, color: Color(0xffFFFFFF)),
  );
}

Widget blacktext(String text, double fontsize, {int color = 0xFF000000F}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'inter',
      fontSize: fontsize,
      color: Color(color),
    ),
  );
}

Widget tapper(Function func) {
  return InkWell(
    onTap: () {
      func;
    },
  );
}

Widget iconwidget(IconData data, String label, {int color = 0xffFFFFF}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    height: 20,

    width: 115,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(data, size: 16, color: Color(color)),
        SizedBox(width: 4),
        Text(label, style: TextStyle(color: Color(0xff6B7C8F), fontSize: 16)),
      ],
    ),
  );
}

Widget taskwidget(Color bgcolor, Color color, String label) {
  return Container(
    alignment: Alignment.center,
    height: 22,
    width: 95,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: bgcolor,
    ),
    child: Text(label, style: TextStyle(color: color)),
  );
}

//capitalise-taskcard
String capitlaise(String s) {
  if (s == '') {
    return s;
  }

  return s[0].toUpperCase() + s.substring(1);
}

//text-priority
String textpriority(int priority) {
  switch (priority) {
    case 1:
      return 'Low';
    case 2:
      return 'Medium';
    case 3:
      return "High Priority";
    default:
      return 'Normal';
  }
}

//backgroound_color-priority
Color bgcolor(int priority) {
  if (priority == 3)
    return Color(0xffFFDCDC);
  else if (priority == 2)
    return Color(0xffFFEDD5);
  else if (priority == 1)
    return Color(0xffF5F8FA);
  return Colors.grey;
}

//text_color
Color textcolor(int priority) {
  if (priority == 3)
    return Color(0xffEF4444);
  else if (priority == 2)
    return Color(0xffF5A34A);
  else if (priority == 1)
    return Color(0xff6B7C8F);
  return Colors.grey;
}
