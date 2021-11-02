
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeincanadalast/static/main_darwer.dart';
import 'package:url_launcher/url_launcher.dart';

class Videos extends StatefulWidget {
  static const route = '/Videos';

  @override
  _VideosState createState() => _VideosState();
}
void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print('could not launch $command');
  }
}

class _VideosState extends State<Videos> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
        key: scaffoldKey,
        drawer:MainDrawer(),
          body: Builder(
          builder: (
            BuildContext context,
          ){
            return OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    child,
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      height: 17.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color: connected ? null : Color(0xFFEE4400),
                        child: connected
                            ? null
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "OFFLINE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                    height: 12.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                );
              },
            child: SingleChildScrollView(
              child: Container(
                height:   MediaQuery.of(context).size.height,
              color: const Color(0xFFFFFFFF),
              child:
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                          child:CustomPaint(
                              painter: BoxShadowPainter(),
                                child: ClipPath(
                                  clipper: ClippingClass(),
                                  //ignore: prefer_const_literals_to_create_immutables
                                  // boxShadow: [const BoxShadow(color:Color.fromRGBO(109, 215, 204, 0.9),blurRadius:5,spreadRadius: 5,
                                  // offset:Offset (0.0 , 1.0)
                                  // )],
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 200.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/1.jpg')),
                              ),
                              child: const Center(child: Text("الحياة في كندا",style: TextStyle(fontSize: 40,color: Colors.white,fontFamily: 'el-messiri-cufonfonts',
                              shadows:[Shadow(color: Colors.black,offset: Offset(3, 3),
                            blurRadius: 15) ]),)),
                            ),
                                                ),
                          ),
                      ),
              ///////////////////
                  Positioned(
                left:(MediaQuery.of(context).size.width)-47,
                top: 20,
                child: IconButton(
                  icon: const Icon(Icons.menu,color:Color.fromRGBO(28, 195, 178, 0.9) ,),
                  onPressed: () => scaffoldKey.currentState!.openDrawer()
                ),
              ),
              ////////////////////  
          
                Positioned(
                    top: 130,
                    left: 20.0,
                    right: 20.0,
                    child: CustomElevation(
                      child: Container(
                      child: const Padding(
                        padding:  EdgeInsets.all(8.0),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color:Color.fromRGBO(28, 195, 178, 0.9), spreadRadius: 3),
                        ],
                      ),
                      height: (MediaQuery.of(context).size.height),
                    ),
                    ),
                                         
                ), 
          /////////////////////////
                       Positioned(
                        top: 230,
                        left: 30.0,
                        right: 30.0,
                        child: CustomElevation(
                            // ignore: deprecated_member_use
                            child: FlatButton.icon(height: 50,
                                 color:const Color.fromRGBO(255, 255, 255, 0.9),
                                 
                              shape: const RoundedRectangleBorder(
                                     side: BorderSide(color: Color.fromRGBO(28, 195, 178, 0.9)),
                                                borderRadius: BorderRadius.all((Radius.circular(40)))),
                              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/Yvideo');
              }, icon: const Icon(Icons.video_camera_front_outlined,size: 30,color: Color.fromRGBO(28, 195, 178, 0.9),), label: Text('فيديوهات',textDirection: TextDirection.rtl,style:  TextStyle(fontSize: 15,)))
                                             )
                    ),
          /////////////////// 
          /////////////////////////
                       Positioned(
                        top: 340,
                        left: 30.0,
                        right: 30.0,
                        child: CustomElevation(
                            // ignore: deprecated_member_use
                            child: FlatButton.icon(height: 50,
                                 color:const Color.fromRGBO(255, 255, 255, 0.9),
                                 
                              shape: const RoundedRectangleBorder(
                                     side: BorderSide(color: Color.fromRGBO(28, 195, 178, 0.9)),
                                                borderRadius: BorderRadius.all((Radius.circular(40)))),
                              onPressed: () {
                customLaunch('https://www.youtube.com/c/CanadiansLife/playlists');
              }, icon: const Icon(Icons.list_rounded,size: 30,color: Color.fromRGBO(28, 195, 178, 0.9),), label: const Text('قوائم التشغيل',style:  TextStyle(fontSize: 15,)))
                                             )
                    ),
          ///////////////////  
          /////////////////////////
                       Positioned(
                        top: 470,
                        left: 30.0,
                        right: 30.0,
                        child: CustomElevation(
                            // ignore: deprecated_member_use
                            child: FlatButton.icon(height: 50,
                                 color:const Color.fromRGBO(255, 255, 255, 0.9),
                                 
                              shape: const RoundedRectangleBorder(
                                     side: BorderSide(color: Color.fromRGBO(28, 195, 178, 0.9)),
                                                borderRadius: BorderRadius.all((Radius.circular(40)))),
                              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/Live');
              }, icon: const FaIcon(FontAwesomeIcons.wifi,size: 25,color: Color.fromRGBO(28, 195, 178, 0.9), ), label: Text('البث المباشر',style:  TextStyle(fontSize: 15,)))
                                             )
                    ),
          ///////////////////                       
                    ],
                  ),
          
              
                ),
            ),
          );
          }
          )

        ),
      );
  }
  
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-90);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 90);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
////////////////////////////////
///
///
class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   Path path = Path();
    path.lineTo(0.0, size.height-90);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 90);
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawShadow(path, const Color.fromRGBO(28, 195, 178, 0.9), 6.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
////////////////////////////
///
///
class CustomElevation extends StatelessWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const CustomElevation({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        
   borderRadius: BorderRadius.all(Radius.circular(40)) ,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(28, 195, 178, 0.4),
      // spreadRadius: 2,
      blurRadius: 6,
      offset: Offset(2,7), 
      // changes position of shadow
    ),
  ],
),
      child: child,
    );
  }
}
