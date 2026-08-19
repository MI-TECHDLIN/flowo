import 'package:flutter/material.dart';

class textfield_card extends StatelessWidget {
  const textfield_card({
    required this.textlabel,
    required this.texthint,
    required this.icondata,
  });

  final String textlabel;
  final String texthint;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textlabel,
          style: TextStyle(
            color: Color(0xff2D3E50),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xffE8EDF2)),
          ),
          height: 56,
          width: 285,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icondata, color: Color(0xffC89FF5)),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                height: 50,
                width: 180,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: texthint,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w300),

                    contentPadding: EdgeInsets.only(left: 0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
