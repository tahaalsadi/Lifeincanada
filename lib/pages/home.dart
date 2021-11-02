
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeincanadalast/static/main_darwer.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:connectivity/connectivity.dart';

class MyHomePage extends StatefulWidget {
  static final route = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                              child: const Center(child: Text("الحياة في كندا",style: TextStyle(fontSize: 35,color: Colors.white,fontFamily: 'el-messiri-cufonfonts',
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
                        top: 280,
                        left: 190.0,
                        right: 30.0,
                    child: InkWell(
                      
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/NEWS');
              },
                      // ignore: avoid_unnecessary_containers
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          
                                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)), 
                                    boxShadow: [
                                      BoxShadow(
                                              color: Color.fromRGBO(28, 195, 178, 0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(5,7), 
                                              
                                      ),
                                    ],
                                  ),
                          child: Card(
                            
                            shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)), // if you need this
                            side: BorderSide(
                            color: Color.fromRGBO(28, 195, 178, 0.9),
                            width: 1,
              ),
            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                               const FaIcon(FontAwesomeIcons.newspaper,size: 40,color: Color.fromRGBO(28, 195, 178, 0.9), ),
                               const Text('أخبار',style:  TextStyle(fontSize: 20,fontFamily: 'el-messiri-cufonfonts',)),
                              ],
                            ),
                          ),
                          
                                        ),
                        ),
                      ),
                    ),
                  ) ,
                  Positioned(
                        top: 280,
                        left: 30.0,
                        right: 190.0,
                    child: InkWell(
                      onTap: (){showInSnackBar("قريباَ");},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                           decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),bottomLeft: Radius.circular(40.0)), 
                                    boxShadow: [
                                      BoxShadow(
                                              color: Color.fromRGBO(28, 195, 178, 0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(5,7), 
                                              
                                      ),
                                    ],
                                  ),
                          child: Card(
                             shape: const RoundedRectangleBorder(
                            borderRadius:BorderRadius.only(topRight: Radius.circular(40.0),bottomLeft: Radius.circular(40.0)),// if you need this
                            side:  BorderSide(
                            color: Color.fromRGBO(28, 195, 178, 0.9),
                            width: 1,
              ),
            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                               const FaIcon(Icons.messenger_rounded,size: 40,color: Color.fromRGBO(28, 195, 178, 0.9), ),
                               const Text('المنتدى',style:  TextStyle(fontSize: 20,fontFamily: 'el-messiri-cufonfonts',)),
                              ],
                            ),
                          ),
                                        ),
                        ),
                      ),
                    ),
                  ),
          
                  Positioned(
                        top: 430,
                        left: 190.0,
                        right: 30.0,
                    child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/Videos');
              },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                           decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),bottomLeft: Radius.circular(40.0)), 
                                    boxShadow: [
                                      BoxShadow(
                                              color: Color.fromRGBO(28, 195, 178, 0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(5,7), 
                                              
                                      ),
                                    ],
                                  ),
                          child: Card(
                             shape: const RoundedRectangleBorder(
                            borderRadius:BorderRadius.only(topRight: Radius.circular(40.0),bottomLeft: Radius.circular(40.0)), // if you need this
                            side: BorderSide(
                            color: Color.fromRGBO(28, 195, 178, 0.9),
                            width: 1,
              ),
            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                               const FaIcon(Icons.video_camera_front_outlined,size: 40,color: Color.fromRGBO(28, 195, 178, 0.9), ),
                               const Text('فيديوهات',style:  TextStyle(fontSize: 20,fontFamily: 'el-messiri-cufonfonts',)),
                              ],
                            ),
                          ),
                                        ),
                        ),
                      ),
                    ),
                  ),
          
                  Positioned(
                        top: 430,
                        left: 30.0,
                        right: 190.0,
                    child: InkWell(
                                  onTap: () {
                Navigator.of(context)
                    .pushNamed('/Contact');
              },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                           decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)), 
                                    boxShadow: [
                                      BoxShadow(
                                              color: Color.fromRGBO(28, 195, 178, 0.4),
                                              // spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(5,7), 
                                              
                                      ),
                                    ],
                                  ),
                          child: Card(
                            
                             shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)) ,// if you need this
                            side: BorderSide(
                            color: Color.fromRGBO(28, 195, 178, 0.9),
                            width: 1,
              ),
            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                               const FaIcon(FontAwesomeIcons.idCard,size: 40,color: Color.fromRGBO(28, 195, 178, 0.9), ),
                               const Text('تواصل معنا',style:  TextStyle(fontSize: 18,fontFamily: 'el-messiri-cufonfonts',)),
                              ],
                            ),
                          ),
                                        ),
                        ),
                      ),
                    ),
                  ),   
          
                                 Positioned(
                    top: (MediaQuery.of(context).size.height)-42,
                    left: 30.0,
                    right: 30.0,
                    child: 
                        // ignore: deprecated_member_use
                       FlatButton(
                             color:const Color.fromRGBO(28, 195, 178, 0.9),
                             onPressed: () {},
                             child: const Text('https://canadians.life',style:  TextStyle(fontSize: 15,color:Color.fromRGBO(255, 255, 255, 0.9), fontFamily: 'el-messiri-cufonfonts',)),
                              shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)))
                                       ),
                                         
                ),                                         
                    ],
                  ),
          
              
                ),
            ),
          );
          }
        ),)
      );
  }
    void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(value,textAlign: TextAlign.center)
    ));
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
        ////last shape
    // var start1 =Offset((size.width)*0.25,size.height-20);
    // var end1 =Offset(size.width/2,size.height);
    // path.quadraticBezierTo(start1.dx, start1.dy, end1.dx, end1.dy);


  
    // var start3 =Offset((size.width)*0.75,size.height-20);
    // var end3 =Offset(size.width,size.height-90);
    // path.quadraticBezierTo(start3.dx, start3.dy, end3.dx, end3.dy);

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

// class CustomElevation extends StatelessWidget {
//   final Widget child;

//   // ignore: use_key_in_widget_constructors
//   const CustomElevation({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
        
//    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)) ,
//   boxShadow: [
//     BoxShadow(
//       color: Color.fromRGBO(28, 195, 178, 0.4),
//       // spreadRadius: 2,
//       blurRadius: 6,
//       offset: Offset(1,4), 
//       // changes position of shadow
//     ),
//   ],
// ),
//       child: child,
//     );
//   }
// }
