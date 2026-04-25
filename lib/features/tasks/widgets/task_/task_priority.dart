import 'package:flutter/material.dart';

import 'package:flowo/constants/constant.dart';

Widget Taskpriority(
  Function state,
  int bordercolor,
  int backgroundcolor,
  String label,
) {
  bool selected = false;

  return GestureDetector(
    onTap: () {
      state(() {
        selected = !selected;
      });
    },
    child: Container(
      height: 40,
      width: 106,
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: selected == false
              ? prioritybordercolor(0xB7F5F8FA)
              : prioritybordercolor(0xFFEF4444),
        ),
        color: selected == false
            ? prioritybackgroundcolor(0xAAF5F8FA)
            : prioritybackgroundcolor(0xffFFDCDC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: prioritypointercolor(0xffEF4444),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(width: 5),
          Text('High'),
        ],
      ),
    ),
  );
}
