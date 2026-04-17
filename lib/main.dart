import 'package:flowo/shared/widgets/main_sshell.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/tasks/task_controller.dart';

const String kTestUserId = 'test_user_001';
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
        home: const MainSshell(),
      ),
    );
  }
}
