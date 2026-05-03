import 'package:flutter/material.dart';

class ReusableIncrementBtn extends StatelessWidget {
  ReusableIncrementBtn({required this.icon, required this.callback});
  IconData icon;
  VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        height: 25,
        width: 25,

        child: Icon(icon, size: 20),
      ),
    );
  }
}



      // Container(
      //           margin: EdgeInsets.only(top: 8),
      //           child: Column(
      //             children: [
      //               SizedBox(child: Text('Date & Time')),
      //               SizedBox(height: 8),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   timerwudget(
      //                     () {
      //                       showTimePicker(
      //                         context: context,
      //                         initialTime: TimeOfDay.now(),
      //                       ).then((value) {
      //                         setState(() {
      //                           time = value!;
      //                         });
      //                       });
      //                     },
      //                     Icons.access_time,
      //                     time: time,

      //                     bgcolor: 0xffF5F8FA,
      //                     bordercolor: 0xffD4B5F5,
      //                   ),
      //                   GestureDetector(
      //                     onTap: () => setState(() {
      //                       selcet_number;
      //                     }),
      //                     child: Container(
      //                       padding: EdgeInsets.fromLTRB(5, 12, 0, 0),
      //                       height: 65,
      //                       width: 130,
      //                       decoration: BoxDecoration(
      //                         color: Color(0x4ED3E0E9),
      //                         borderRadius: BorderRadius.circular(27),
      //                         border: Border.all(
      //                           color: Color(0xffD4B5F5),
      //                           width: 2,
      //                         ),
      //                       ),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               ReusableIncrementBtn(
      //                                 icon: Icons.remove,
      //                                 callback: () {
      //                                   '''
      //                   edge:case since the duration picker is not flexible i use a third party package to select a number it weould be more efficeient than a ontap''';

      //                                   setState(() {
      //                                     duration--;
      //                                   });
      //                                 },
      //                               ),
      //                               Text(
      //                                 duration.toString(),
      //                                 style: TextStyle(
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 20,
      //                                   color: Color(0xff2D3E50),
      //                                 ),
      //                               ),

      //                               ReusableIncrementBtn(
      //                                 icon: Icons.add,

      //                                 callback: () {
      //                                   setState(() {
      //                                     duration++;
      //                                   });
      //                                 },
      //                               ),
      //                             ],
      //                           ),

      //                           Text('min'),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),