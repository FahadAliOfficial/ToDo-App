import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/index_page.dart';
import 'notification/notification.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //await NotificationService.init();
  tz.initializeTimeZones();



  //init the Hive
  await Hive.initFlutter();
  //open the hive box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),   
      
    ) ;
  }
}
