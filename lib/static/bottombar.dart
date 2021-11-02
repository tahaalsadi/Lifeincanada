import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeincanadalast/pages/bloge.dart';
import 'package:lifeincanadalast/pages/contact.dart';
import 'package:lifeincanadalast/pages/news.dart';
import 'package:lifeincanadalast/pages/videos.dart';
class BottomBar extends StatefulWidget {
  static const route = '/BottomBar';
 final int i;
  const BottomBar({ required this.i, });

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
      int selectedPage = 0;
  final _pageOptions = [NEWS(), Blog(), Videos(),Contact()];
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: ConvexAppBar(
                  backgroundColor: Color.fromRGBO(28, 195, 178, 0.9) ,
            height: 50, elevation: 16,
            style: TabStyle.react,
            items: [
              TabItem(icon:FontAwesomeIcons.newspaper, title: 'أخبار '),
              TabItem(icon: Icons.messenger_rounded, title: 'المنتدى'),
              TabItem(icon: Icons.video_camera_front_outlined, title: 'فيديوهات'),
              TabItem(icon: FontAwesomeIcons.idCard, title: 'التواصل معنا'),
            ],
            initialActiveIndex: selectedPage, //optional, default as 0
            onTap: (i) {
              setState(() {
                selectedPage = i;
              });
            },
          ), // This trailing comma makes auto-formatting nicer for build methods.
        
      
    );
  }
}