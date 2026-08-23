import 'package:flowo/features/profile/widget/reuseable_avatatr.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({super.key});

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            height: 80,

            width: 80,
            decoration: BoxDecoration(
              color: Color(0xff8B5CF6),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              'JD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusable_avatar(color: 0xff8B5CF6),
                reusable_avatar(color: 0xffF472B6),

                reusable_avatar(color: 0xff60A5FA),
                reusable_avatar(color: 0xff34D399),
                reusable_avatar(color: 0xffFB923C),
                reusable_avatar(color: 0xffFBBF24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
