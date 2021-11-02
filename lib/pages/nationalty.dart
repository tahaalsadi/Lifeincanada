
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:html/parser.dart';
import 'package:lifeincanadalast/models/nationalty_model.dart';
import 'package:lifeincanadalast/servises/nationalty_services.dart';
import 'package:lifeincanadalast/static/main_darwer.dart';
import 'package:readmore/readmore.dart';

class Nationalty extends StatefulWidget {
   static const route = '/Nationalty';

  @override
  _NationaltyState createState() => _NationaltyState();
}

class _NationaltyState extends State<Nationalty> {
   var scaffoldKey = GlobalKey<ScaffoldState>();
  // final _debouncer = Debouncer(milliseconds: 2000);
   ScrollController _controller = ScrollController();
       List<Nationaltyy> nationalty= [];
  List<Nationaltyy> filteredNationalty = [];

  @override
  void initState() {
    /////////5
    super.initState();

    NationaltyService.getNationalty().then((nationaltyFromServer) {
      setState(() {
        nationalty = nationaltyFromServer;
        filteredNationalty = nationalty;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
        key: scaffoldKey,
        drawer:MainDrawer(),
          body:  Builder(
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
                              child: const Center(child: Text("أخبار ومواضيع",style: TextStyle(fontSize: 35,color: Colors.white,fontFamily: 'el-messiri-cufonfonts',
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
                    left: 20.0,
                    right: 20.0,
                    child: CustomElevation(
                      child:Container(
                        padding: const EdgeInsets.only(top: 20,left: 6, right: 6),
                      child:Column(
                          children: <Widget>[
                            TextField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(15.0),
                                hintText: '  عن ماذا تبحث ...',
                              ),
                              onChanged: (string) {
                              //  _debouncer. run(() {
                                  setState(() {
                                    filteredNationalty = nationalty
                                        .where((u) => (u.title
                                                .toLowerCase()
                                                .contains(string.toLowerCase()) ||
                                            u.content
                                                .toLowerCase()
                                                .contains(string.toLowerCase())))
                                        .toList();
                                  });
                                // });
                              },
                            ),
                          Expanded(
                            child:  DraggableScrollbar.semicircle(
                                controller: _controller,
                              child: ListView.builder(
                                                    
                                          itemCount: filteredNationalty.length,
                                          itemBuilder: (context, index) {
                                            var imageurl = filteredNationalty[index].imageUrl;
                                                    
                                            return Card(
                                                child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                
                                                  // ignore: unnecessary_null_comparison
                                                  if (imageurl != null)
                                                   Center(
                                                     child: ClipRRect(
                                                          borderRadius: const BorderRadius.all( Radius.circular(8.0),),
                                              
                                                        child: FadeInImage.assetNetwork(
                                                           height: 150,width: 300,
                                                           fit:BoxFit.fill,
                                                            placeholder: 'assets/images/loadercyan.gif',
                                                            image: imageurl),
                                                      ),
                                                   ),
                                                  Text(
                                                    filteredNationalty[index].title,
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromRGBO(28, 195, 178, 0.9)),
                                                    textDirection: TextDirection.rtl,
                                                  ),
                                                  ReadMoreText(
                                                    parse(filteredNationalty[index]
                                                            .content
                                                            .toString())
                                                        .documentElement!
                                                        .text,
                                                    trimLines: 2,
                                                    colorClickableText: Colors.pink,
                                                    trimMode: TrimMode.Line,
                                                    trimCollapsedText: '...Read more',
                                                    trimExpandedText: ' Less',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                    textDirection: TextDirection.rtl,
                                                  ),
                                                  Text(
                                                    filteredNationalty[index].author_info,
                                                  ),
                                                  Text(
                                                    filteredNationalty[index].date,
                                                  ),
                                                ],
                                              ),
                                            ));
                                          },
                                        ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.white,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(color:Color.fromRGBO(28, 195, 178, 0.9), spreadRadius: 2),
                        ],
                      ),
                      height: (MediaQuery.of(context).size.height),
                    ),
                    ),
                                         
                ), 
          /////////////////////////
          
                 const Positioned(
                    top: 210,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Center(child: Text('الجنسية الكندية',style:  TextStyle(fontSize: 25,color: Colors.black, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,))
                    )
                ),                                       
                    ],
                  ),
          
              
                ),
          );
          }
          ),
        )
        
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
  const CustomElevation({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        
   borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)) ,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(28, 195, 178, 0.4),
      // spreadRadius: 2,
      blurRadius: 10,
      // offset: Offset(10,-7), 
      // changes position of shadow
    ),
  ],
),
      child: child,
    );
  }
}
