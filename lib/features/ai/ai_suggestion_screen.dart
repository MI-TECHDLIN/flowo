import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/ai/ai_card.dart';
import 'package:flowo/features/tasks/task_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO: for the AI suggestion screen i used a replacaeble desgin not like that in figma link

class AiSuggestionScreen extends StatefulWidget {
  const AiSuggestionScreen({super.key});

  @override
  State<AiSuggestionScreen> createState() => _AiSuggestionScreenState();
}

class _AiSuggestionScreenState extends State<AiSuggestionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TaskController>().fetchSuggestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TaskController>();
    // this is v1-frontend   no api rq called
    return Scaffold(
      body: SingleChildScrollView(
        child: controller.isloadingsug
            ? Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Flowo is thinking...'),
                  ],
                ),
              )
            : Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 4),
                child: controller.suggestion.ranked_tasks == ''
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.lightbulb_outline,
                              size: 64,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            const Text('No suggestions yet'),
                            const SizedBox(height: 8),
                            FilledButton(
                              onPressed: () => controller.fetchSuggestions(),
                              child: const Text("get Suggestons"),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.suggestion!.daily_focus,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            controller.suggestion!.daily_focus,
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
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ...controller.suggestion!.ranked_tasks
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    final index = entry.key + 1;
                                    final task = entry.value;
                                    return AiCard(
                                      index: index,
                                      title: task.title,
                                      reasoning: task.reasoning,
                                      estimatedEffort: task.estimated_effort,
                                      impactlevel: task.impact_level,
                                    );
                                  }),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            controller!.suggestion.disclaimer,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}
