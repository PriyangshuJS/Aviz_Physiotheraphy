import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:usersidefirebase/PhysiotheraphyScreen/Activity8.dart';
import 'package:usersidefirebase/PhysiotheraphyScreen/BookAppointment7.dart';
import 'package:usersidefirebase/PhysiotheraphyScreen/PlanBook5.dart';
import 'package:usersidefirebase/PhysiotheraphyScreen/clinicVisit6.dart';
import 'package:usersidefirebase/PhysiotheraphyScreen/packages4.dart';
import 'package:get/get.dart';
import 'package:usersidefirebase/PhysiotheraphyScreen/userDetail2.dart';
import 'PhysiotheraphyScreen/Current9.dart';
import 'PhysiotheraphyScreen/MainPage1.dart';

import 'PhysiotheraphyScreen/packages3.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage1(),
      getPages: [
        GetPage(name: "/", page: () => MainPage1()),
        GetPage(name: "/scr2", page: () => UserDetail()),
        GetPage(name: "/sc3", page: () => Packages3()),
        GetPage(name: "/sc4", page: () => Packages4()),
        GetPage(name: "/scr5", page: () => PlanBook()),
        GetPage(name: "/scr6", page: () => ClinicVisit()),
        GetPage(name: "/scr7", page: () => BookAppointment7()),
        GetPage(name: "/scr8", page: () => Activity8()),
        GetPage(name: "/scr9", page: () => Current()),
      ],
    );
  }
}
