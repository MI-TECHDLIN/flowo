import 'package:flowo/features/profile/widget/reuseable_avatar.dart';
import 'package:flutter/material.dart';

enum colorprority { color1, color2, color3, color4, color5, color6 }

class AvatarCard extends StatefulWidget {
  const AvatarCard({super.key});

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  int profilecolor = 0xff8B5CF6;
  int bgcolor = 0xFFAA8CF0;
  int transparent = 0x008A5CF6;

  colorprority state_color = colorprority.color1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            height: 80,

            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999),
              color: Color(profilecolor),
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
                reusable_avatar(
                  bordercolor: state_color == colorprority.color1
                      ? bgcolor
                      : transparent,
                  color: 0xff8B5CF6,
                  ontouch: () => setState(() {
                    profilecolor = 0xff8B5CF6;
                    state_color = colorprority.color1;
                  }),
                ),

                reusable_avatar(
                  bordercolor: state_color == colorprority.color2
                      ? bgcolor
                      : transparent,
                  color: 0xffF472B6,
                  ontouch: () => setState(() {
                    profilecolor = 0xffF472B6;
                    state_color = colorprority.color2;
                  }),
                ),

                reusable_avatar(
                  bordercolor: state_color == colorprority.color3
                      ? bgcolor
                      : transparent,
                  color: 0xff60A5FA,
                  ontouch: () => setState(() {
                    profilecolor = 0xff60A5FA;
                    state_color = colorprority.color3;
                  }),
                ),
                reusable_avatar(
                  bordercolor: state_color == colorprority.color4
                      ? bgcolor
                      : transparent,
                  color: 0xff34D399,
                  ontouch: () => setState(() {
                    profilecolor = 0xff34D399;
                    state_color = colorprority.color4;
                  }),
                ),
                reusable_avatar(
                  bordercolor: state_color == colorprority.color5
                      ? bgcolor
                      : transparent,
                  color: 0xffFB923C,
                  ontouch: () => setState(() {
                    profilecolor = 0xffFB923C;
                    state_color = colorprority.color5;
                  }),
                ),
                reusable_avatar(
                  bordercolor: state_color == colorprority.color6
                      ? bgcolor
                      : transparent,
                  color: 0xffFBBF24,
                  ontouch: () => setState(() {
                    profilecolor = 0xffFBBF24;
                    state_color = colorprority.color6;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
