import 'package:flowo/shared/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/tasks/task_functions.dart';

//TODO:this timer material widget lags i will get a third  party pckage
//ToDo:make sure to remove test mode from firestore dbs
//TODO: disabling time fime stamp feature this feature might be later introduce on production i am replacing it with a countdown features
//TODO: coming back to frontend--later
const String kTestUserId = 'test_user_002';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlowoApp());
}

class FlowoApp extends StatelessWidget {
  const FlowoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskController(),
      child: MaterialApp(
        title: 'Flowo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6C63FF)),
          useMaterial3: true,
        ),
        home: Bottomnav(),
      ),
    );
  }
}
