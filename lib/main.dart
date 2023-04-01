import 'package:flutter/material.dart';
import 'package:netflix/screen/home_screen.dart';
import 'package:netflix/screen/like_screen.dart';
import 'package:netflix/screen/more_screen.dart';
import 'package:netflix/screen/search_screen.dart';
import 'package:netflix/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late TabController controller;


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'netflix',
      theme:ThemeData(brightness: Brightness.dark,primaryColor: Colors.black, accentColor: Colors.white) ,
      home: DefaultTabController(length:4,
        child:Scaffold(
          body: TabBarView(physics: NeverScrollableScrollPhysics(),// 스크롤을 하여도 밀리지 않게
            children: [
              Home(),
              SearchScreen(),
              LikeScreen(),
              More(),
            ],),
          bottomNavigationBar: Bottom(),
        )

        ,),


    );
  }
}