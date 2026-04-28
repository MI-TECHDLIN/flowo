import 'package:flutter/cupertino.dart';

Color prioritybordercolor(int inactive) {
  return Color(inactive);
}

Color prioritytexttextcolor(int inactive) {
  return Color(inactive);
}

Color prioritybackgroundcolor(int inactive) {
  return Color(inactive);
}

Color prioritypointercolor(int inactive) {
  return Color(inactive);
}

Widget whitetext(String text, double fontsize) {
  return Text(
    text,
    style: TextStyle(fontSize: fontsize, color: Color(0xffFFFFFF)),
  );
}
