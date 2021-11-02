import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'rating.dart';
import 'package:flutter_share/flutter_share.dart';
class MainDrawer extends StatefulWidget {
  static final route = '/MainDrawer';

  @override
  _MainDrawerState createState() => _MainDrawerState();
}
void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print('could not launch $command');
  }
}
Future<void> share() async {
    await FlutterShare.share(
        title: 'مشاركة التطبيق',
        text: 'اطلع على اخر المستجدات والاخبار بشأن اللجوء والهجرة الى كندا الان',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.linkyou.lifeincanadaa',
        chooserTitle: 'Example Chooser Title');
  }
class _MainDrawerState extends State<MainDrawer> {  
 
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color.fromRGBO(28, 195, 178, 0.9),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 30, bottom: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       '',
                        //     ),
                        //     fit: BoxFit.fill),
                      ),
                    ),
                    // const Text(
                    //   'أسامة الداولي',
                    //   style: TextStyle(
                    //     fontSize: 22,
                    //     color: Colors.white,
                        
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

///////////////////////////////////
            ListTile(
              leading: const Icon(Icons.notifications_on_outlined, color:  Color.fromRGBO(28, 195, 178, 0.9),),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child:    const Text(
                    'الإشعارات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 18,
                      
                    ),
                  ),
                    ),
                    Switch(
                      activeColor:  const Color.fromRGBO(28, 195, 178, 0.9),
                      value: status,
                      onChanged: (val) {
                        setState(() {
                          
                          status = val;
                //  Notify();  //localnotification method call below
                   // when user top on notification this listener will work and user will be navigated to notification page
                // AwesomeNotifications().actionStream.listen((receivedNotifiction){
                //   Navigator.of(context).pushNamed(
                //     '/',
                //   );
                // }); 
                        });
                      },  
                    ),
                    
                  ],
                ),
              onTap: () {
                        
                //      Notify();  //localnotification method call below
                //    // when user top on notification this listener will work and user will be navigated to notification page
                // // AwesomeNotifications().actionStream.listen((receivedNotifiction){
                // //   Navigator.of(context).pushNamed(
                // //     '/',
                // //   );
                // // });   
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color:  Color.fromRGBO(28, 195, 178, 0.9)),
              title: const Text(
                'عن التطبيق',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  
                ),
              ),
              onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return About();
                  });
            },
            ),

             ListTile(
              leading:  const Icon(Icons.rate_review, color:  Color.fromRGBO(28, 195, 178, 0.9)),
              title: 
                 const Text(
                  ' قيم التطبيق',
                  style: TextStyle(
                    fontSize: 18
                    ,
                  ),
                ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RatingBar();
                  });
            },
            ),
             ListTile(
              leading:  const Icon(Icons.share, color:  Color.fromRGBO(28, 195, 178, 0.9)),
              title: 
                 const Text(
                  ' مشاركة التطبيق',
                  style: TextStyle(
                    fontSize: 18
                    ,
                  ),
                ),
            onTap: () {
               share();
            },
            ),
            const SizedBox(height:170,),
            //  const ListTile(
            //   title: 
            //      Center(
            //        child: Text(
            //         ' تسجيل الخروج ',
            //         style: TextStyle(
            //           fontSize: 18
            //           ,color:  Color.fromRGBO(28, 195, 178, 0.9)
            //         ),
            //     ),
            //      ),
            // ),

          ],
        ),
      ),
    );
  }
  
}


// // ignore: non_constant_identifier_names
// void Notify()  async{
//   String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
//  await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 1,
//         channelKey: 'key1',
//         title: 'منشور جديد ',
//         body: 'اطلع على اخر منشورات جديدة حول الحياة والدراسة في كندا',
//         bigPicture: 'data:image/jpeg;base64,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',
//         notificationLayout: NotificationLayout.BigPicture
//       ),
//    schedule: NotificationInterval(interval: 2,timeZone: timezom,repeats: true),
//   );
// }