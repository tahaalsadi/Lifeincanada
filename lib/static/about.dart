import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Consts {
  static const double padding = 16;
  static const double avatarRadius = 66;
  Consts._();
}

class About extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.padding)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      
    );
  }
   dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: const EdgeInsets.only(),
          decoration: BoxDecoration(
                    border: Border.all(
          color: const Color.fromRGBO(28, 195, 178, 0.9),
          width: 2,
          
        ),
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    color: Color.fromRGBO(28, 195, 178, 0.4) , blurRadius: 10, offset: Offset(5,7))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              const Text(
                "عن التطبيق",
                style:  TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: Consts.padding,
              ),
              const Text("عملنا جاهدين لتوفير المعلومات والخدمات التي من شأنها مساعدة القادمين الجدد الى كندا والمقيمين في كندا في مختلف المجالات العملية والعلمية والمعيشية من خلال تقديم خدماتنا ونصائحنا بطرق مختلفة وعلى نطاق واسع", style:  TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    ),textDirection: TextDirection.rtl),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomRight,
                // ignore: deprecated_member_use
                child: Center(
                  child: CustomElevation(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                             color:const Color.fromRGBO(28, 195, 178, 0.9),
                             onPressed: () {
                      Navigator.of(context).pop();},
                             child: const Text('تم',style:  TextStyle(fontSize: 17,color:Color.fromRGBO(255, 255, 255, 0.9), fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl ,),
                              shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all((Radius.circular(15))))
                                       ),
                                         ),
                ),
                  
                  
                ),
              
            ],
          ),
        ),
  
      ],
    );
  }
}


class CustomElevation extends StatelessWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const CustomElevation({required this.child});

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