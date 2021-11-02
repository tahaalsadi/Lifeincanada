
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lifeincanadalast/static/input.dart';
import 'package:lifeincanadalast/static/password.dart';

class NewAcount extends StatefulWidget {
  static final route = '/newaccount';
  @override
  _NewAcountState createState() => _NewAcountState();
}

class _NewAcountState extends State<NewAcount> {bool status6 = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height:  MediaQuery.of(context).size.height,
            color: const Color(0xFFFFFFFF),
            child: Stack(
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
    
               const Positioned(
                  top: 200,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('إسم المستخدم',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
                const Positioned(
                  top: 222,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithIcon(
                        icon: Icons.person_outline,
                      ),
                  )
              ),
                
              const Positioned(
                  top: 277,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('البريد الألكتروني',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
              const Positioned(
                  top: 299,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithIcon(
                        icon: Icons.mail_outline,
                    
                      ),
                  ),
              ),

              const Positioned(
                  top: 350,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('كلمة المرور',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
                const Positioned(
                  top: 370,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithIcon(
                        icon: Icons.lock_outline,
                      ),
                  )
              ),
                
              const Positioned(
                  top: 420,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('تاريخ الميلاد',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
              const Positioned(
                  top: 440,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithPasswordIcon(
                        icon: Icons.calendar_today_outlined,
                    
                      ),
                  ),
              ),

              const Positioned(
                  top: 477,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(   decoration: InputDecoration(
                                         focusedBorder: UnderlineInputBorder(
                                                     borderSide: BorderSide(
                                                                color:  Color.fromRGBO(28, 195, 178, 0.9)
                                                                    ),
                                                 ),
                                         hintText: 'الجنس',
                                         hintStyle:  TextStyle(
                                                       color: Colors.grey
                                                              ),
                                                              
                               ),),
                    ) ,
                  )
              ),
               Positioned(
                  top: 495,
                  left: 0.0,
                  right: 227.0,
                  child: Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: FlutterSwitch(
                      activeText: "ذكر",
                      inactiveText: "انثى",
                      // activeToggleColor:const Color.fromRGBO(255, 255, 225, 0.9) ,
                      activeColor: const Color.fromRGBO(28, 195, 178, 0.9),
                      inactiveColor: const Color.fromRGBO(28, 195, 178, 0.9),
                      value: status6,
                      valueFontSize: 10.0,
                      width: 110,
                      borderRadius: 30.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status6 = val;
                        });
                      },
                    ),
                  )
              ),
              const Positioned(
                  top: 540,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('العنوان',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
              const Positioned(
                  top: 560,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithPasswordIcon(
                        icon: Icons.location_on_outlined,
                    
                      ),
                  ),
              ),

              
               Positioned(
                  top: 660,
                  left: 30.0,
                  right: 30.0,
                  child: CustomElevation(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                           color:const Color.fromRGBO(28, 195, 178, 0.9),
                           onPressed: () {},
                           child: const Text('التالي',style:  TextStyle(fontSize: 15,color:Color.fromRGBO(255, 255, 255, 0.9), fontFamily: 'el-messiri-cufonfonts',)),
                            shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all((Radius.circular(15))))
                                     ),
                                       )
              ),
              const Positioned(
                  top: 620,
                  left: 0.0,
                  right: 70.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('أنا بالفعل أمتلك  حساب؟',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),)
                  )
              ),
              Positioned(
                  top: 620,
                  left: 0.0,
                  right: 227.0,
                  child: Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).pushNamed('/'),
                      child: const Text('تسجيل دخول',style:  TextStyle(fontSize: 15,color:Color.fromRGBO(28, 195, 178, 0.9), fontFamily: 'el-messiri-cufonfonts',),))
                  )
              ),
                

              ],
            ),
              ),
          ),
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
class CustomElevation extends StatelessWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const CustomElevation({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        
   borderRadius: BorderRadius.all((Radius.circular(30))) ,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(28, 195, 178, 0.4),
      // spreadRadius: 2,
      blurRadius: 6,
      offset: Offset(1,4), 
      // changes position of shadow
    ),
  ],
),
      child: child,
    );
  }
}
