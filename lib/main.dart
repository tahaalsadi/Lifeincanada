
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'pages/bloge.dart';
import 'pages/contact.dart';
import 'pages/home.dart';
import 'pages/homee.dart';
import 'pages/house.dart';
import 'pages/live.dart';
import 'pages/login.dart';
import 'pages/nationalty.dart';
import 'pages/newaccount.dart';
import 'pages/news.dart';
import 'pages/stay.dart';
import 'pages/study.dart';
import 'pages/tourism.dart';
import 'pages/videos.dart';
import 'pages/vlist.dart';
import 'pages/work.dart';
import 'pages/youtubeVideo.dart';
import 'static/main_darwer.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main()  => runApp(MyApp());

// ignore: camel_case_types
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var route;
     return Directionality(
        textDirection: TextDirection.rtl,
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
         theme: ThemeData(fontFamily: 'el-messiri-cufonfonts',
         primaryColor:Colors.teal,
         visualDensity: VisualDensity.adaptivePlatformDensity,),
       initialRoute: 'Homee.route',
       
      routes: {
        Homee.route:(c)=>Homee(),
        Login.route:(c)=>Login(),
        MyHomePage.route: (c) => MyHomePage(),
        NewAcount.route:(c)=>NewAcount(),
        MainDrawer.route:(c)=>MainDrawer(),
        NEWS.route:(c)=>NEWS(),
        Stay.route:(c)=>Stay(),
        Blog.route:(c)=>Blog(),
        Videos.route:(c)=>Videos(),
        Contact.route:(c)=>Contact(),
        House.route:(c)=>House(),
        // ignore: equal_keys_in_map
        Nationalty.route:(c)=>Nationalty(),
        Tourism.route:(c)=>Tourism(),
        Work.route:(c)=>Work(),
        Study.route:(c)=>Study(),
        Yvideo.route:(c)=>Yvideo(),
        Vlist.route:(c)=>Vlist(),
        Live.route:(c)=>Live()
        // ignore: prefer_const_constructors
        
      }
        // routes: {
        //   Info.route: (c) => Info(),
        // }
         ),
     );
  }
}
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/ic_launcher.png'),
      ),
    );
  }
}