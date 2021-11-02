
import 'package:flutter/material.dart';
import 'package:lifeincanadalast/static/input.dart';
import 'package:lifeincanadalast/static/password.dart';

import 'forgot.dart';
class Login extends StatefulWidget {
   static final route = '/Login';

  @override
  _LoginState createState() => _LoginState();
}
bool isCheck = false;
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height:  MediaQuery.of(context).size.height,
            color: Color(0xFFFFFFFF),
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
            
                  // const Center(child: Text('مرحبا بك',style: TextStyle(fontSize: 30,color: Colors.white70,fontFamily: 'el-messiri-cufonfonts',))),
                 Positioned(
                  top: 240,
                  left: 0.0,
                  right: 145.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('مرحبا بك',style:  TextStyle(fontSize: 30,color: Color.fromRGBO(28, 195, 178, 0.9), fontFamily: 'el-messiri-cufonfonts',),)
                  )
              ),
                
              Positioned(
                  top: 320,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('قم بتسجيل الدخول للتمكن من الدخول الى المنتدى',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
               Positioned(
                  top: 360,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('إسم المستخدم',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
                Positioned(
                  top: 390,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithIcon(
                        icon: Icons.person_outline,
                      ),
                  )
              ),
                
              Positioned(
                  top: 460,
                  left: 0.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('كلمة المرور',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,)
                  )
              ),
                
              Positioned(
                  top: 490,
                  left: 25.0,
                  right: 25.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InputWithPasswordIcon(
                        icon: Icons.lock_outlined,
                    
                      ),
                  ),
              ),
              
              Positioned(
                  top: 554,
                  left: 320.0,
                  right: 0.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:Checkbox(
                       activeColor: Colors.white,
                     value:isCheck, onChanged: (value) => setState(() {
                       if(isCheck == false)
                  {
            // Put your code here which you want to execute on CheckBox Checked.
            setState(() {
              isCheck = true;
                
                  });
                
                }
                else
                {
                  // Put your code here which you want to execute on CheckBox Un-Checked.
                  setState(() {
                    isCheck = false;
                  });
                }    
                              }),
                            checkColor: Color.fromRGBO(28, 195, 178, 0.9),
                            
                    ),
                        )
                    ),
              
                
              Positioned(
                  top: 560,
                  left: 0.0,
                  right: 240.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: FlatButton(
                      child: Text('نسيت كلمة المرور!',style:  TextStyle(fontSize: 15,color: Color.fromRGBO(28, 195, 178, 0.9), fontFamily: 'el-messiri-cufonfonts',),)
                        , onPressed: (){         
                  showDialog(
                  context: context,
                  
                  builder: (BuildContext context) {
                    return Forgot();
                  });
                },
                      )
                  )
              ),
                
             Positioned(
                  top: 570,
                  left: 0.0,
                  right: 60.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('تذكرني',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl)
                  )
              ),
              
               Positioned(
                  top: 615,
                  left: 30.0,
                  right: 30.0,
                  child: CustomElevation(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                           color:Color.fromRGBO(28, 195, 178, 0.9),
                           onPressed: () {},
                           child: Text('تسجيل الدخول',style:  TextStyle(fontSize: 15,color:Color.fromRGBO(255, 255, 255, 0.9), fontFamily: 'el-messiri-cufonfonts',)),
                            shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all((Radius.circular(15))))
                                     ),
                                       )
              ),
              Positioned(
                  top: 680,
                  left: 0.0,
                  right: 40.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text('لايوجد لدي حساب؟',style:  TextStyle(fontSize: 15,color: Colors.grey, fontFamily: 'el-messiri-cufonfonts',),)
                  )
              ),
              Positioned(
                  top: 680,
                  left: 0.0,
                  right: 165.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).pushNamed('/newaccount'),
                      child: Text('إنشاء حساب',style:  TextStyle(fontSize: 15,color:Color.fromRGBO(28, 195, 178, 0.9), fontFamily: 'el-messiri-cufonfonts',),))
                  )
              ),

                 Positioned(
                  top: 680,
                  left: 0.0,
                  right: 300.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).pushNamed('/home'),
                      child: Text('<< تخطي',style:  TextStyle(fontSize: 15,color:Color.fromRGBO(28, 195, 178, 0.9), fontFamily: 'el-messiri-cufonfonts',),))
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

class CustomElevation extends StatelessWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const CustomElevation({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
   borderRadius: BorderRadius.all((Radius.circular(30))) ,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(28, 195, 178, 0.4),
      // spreadRadius: 2,
      blurRadius: 6,
      offset: Offset(1,4), // changes position of shadow
    ),
  ],
),
      child: child,
    );
  }
}
