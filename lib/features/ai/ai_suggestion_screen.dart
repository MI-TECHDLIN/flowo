import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/ai/ai_card.dart';
import 'package:flutter/material.dart';

//TODO: for the AI suggestion screen i used a replacaeble desgin not like that in figma link

class AiSuggestionScreen extends StatelessWidget {
  const AiSuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    '''
this is v1-frontend   no api rq called
    ''';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Here's what i recommend -- you decide",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),

              //top pick
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffC89FF5),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 130,
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46,
                      width: 46,

                      decoration: BoxDecoration(
                        color: Color(0x4DEEE3F9),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.light_mode_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 35),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TODAY'S FOCUS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 230,
                            child: Text(
                              capitlaise(
                                'Start with the project Proposal --- it unblocks your most impactful work today',
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              AiCard(),
            ],
          ),
        ),
      ),
    );
  }
}
