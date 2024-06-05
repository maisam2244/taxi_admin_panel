import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taxi_admin_panel/add_event_new.dart';
import 'package:taxi_admin_panel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Add_Event_Page(),
    );
  }
}