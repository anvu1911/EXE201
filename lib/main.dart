import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/started_page.dart';
import 'package:exe201/service/alarm_service.dart';
import 'package:exe201/service/notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'context/alarm_context.dart';
import 'data/data.dart';
import 'firebase_options.dart';
import 'helper/helper_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await AlarmService.init();
  NotificationService.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AndroidAlarmManager.initialize();

  // runApp(const ProviderWrapper());
  runApp(ChangeNotifierProvider(
    create: (_) => AlarmContext(),
    child: MyApp(),
  ));
}

// class ProviderWrapper extends StatelessWidget {
//   const ProviderWrapper({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final AlarmContext alarmContext = AlarmContext();
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AlarmContext>(
//           create: (BuildContext context) => alarmContext,
//         )
//       ],
//       child: const MyApp(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'ClockWork',
//         debugShowCheckedModeBanner: false,
//         home: HomePage());
//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _getUserLoggedInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shleep',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: _isSignedIn ? const HomePage() : StartedPage(),
    );
  }

  void _getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
    setState(() {});
  }
}

// class _MyAppState extends State<MyApp> {
//   bool _isSignedIn = false;
//
//   // This widget is the root of your application.
//   @override
//   void initState() {
//   super.initState();
//   _getUserLoggedInStatus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   final AlarmContext alarmContext = AlarmContext();
//
//   return MaterialApp(
//   initialRoute: '/',
//   routes: {
//   '/wakeup': (context) => WakeupPage(),
//   },
//
//   title: 'Shleep',
//   home: _isSignedIn ? const HomePage() : StartedPage(),
//   );
//   }
// }
