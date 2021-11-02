import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'bloge.dart';
import 'contact.dart';
import 'home.dart';
import 'news.dart';
import 'videos.dart';

class Homee extends StatefulWidget {
  static const route = '/';

  @override
  _HomeeState createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  //   final RateMyApp _rateMyApp = RateMyApp(
  //   preferencesPrefix: 'rateMyApp_',
  //   minDays: 3,
  //   minLaunches: 7,
  //   remindDays: 2,
  //   remindLaunches: 5,
  //   // appStoreIdentifier: '',
  //   // googlePlayIdentifier: '',
  // );

  // @override
  // void initState() {
  //   super.initState();
  //    _rateMyApp.init().then((_) {
  //     // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
  //     // if (_rateMyApp.shouldOpenDialog) {
  //       _rateMyApp.showStarRateDialog(
  //         context,
  //         title: 'Enjoying Flutter Rating Prompt?',
  //         message: 'Please leave a rating!',
  //         onRatingChanged: (stars) {
  //           return [
  //             FlatButton(
  //               child: Text('Ok'),
  //               onPressed: () {
  //                 if (stars != null) {
  //                   _rateMyApp.doNotOpenAgain = true;
  //                   _rateMyApp.save().then((v) => Navigator.pop(context));

  //                   if (stars <= 3) {
  //                     // print('Navigate to Contact Us Screen');
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (_) => Contact(),
  //                       ),
  //                     );
  //                   } else if (stars <= 5) {
  //                     // print('Leave a Review Dialog');
  //                     // showDialog();
  //                   }
  //                 } else {
  //                   Navigator.pop(context);
  //                 }
  //               },
  //             ),
  //           ];
  //         },
  //         dialogStyle: DialogStyle(
  //           titleAlign: TextAlign.center,
  //           messageAlign: TextAlign.center,
  //           messagePadding: EdgeInsets.only(bottom: 20.0),
  //         ),
  //         starRatingOptions: StarRatingOptions(),
  //       );
  //     // }
  //   });
  // }
      int selectedPage = 0;
  final _pageOptions = [MyHomePage(), NEWS(),  Videos(), Contact()];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: DoubleBackToCloseApp(
            child: _pageOptions[selectedPage],
            snackBar: const SnackBar(
              content:Text('اضغط مرة اخرى للخروج', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,),
            
            ),
          ),
        ),

        bottomNavigationBar: ConvexAppBar(
          height: 50, elevation: 16,
          style: TabStyle.react,
          backgroundColor:  Color.fromRGBO(28, 195, 178, 0.9),
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const TabItem(icon: Icons.house, title: 'الرئيسية'),
            const TabItem(icon:FontAwesomeIcons.newspaper, title: 'أخبار'),
            // const TabItem(icon: Icons.messenger_rounded, title: 'المنتدى'),
            const TabItem(icon:Icons.video_camera_front_outlined, title: 'فيديوهات'),
            const TabItem(icon: FontAwesomeIcons.idCard ,title: 'تواصل معنا'),
          ],
          initialActiveIndex: selectedPage, //optional, default as 0
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}