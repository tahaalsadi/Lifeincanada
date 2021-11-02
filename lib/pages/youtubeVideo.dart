
import 'package:flutter/material.dart';
import 'package:lifeincanadalast/models/channel_model.dart';
import 'package:lifeincanadalast/models/video_model.dart';
import 'package:lifeincanadalast/servises/api_services.dart';
import 'package:lifeincanadalast/static/main_darwer.dart';
import 'dart:async';
import 'video_screen.dart';
class Yvideo extends StatefulWidget {
   static const route = '/Yvideo';

  @override
  _YvideoState createState() => _YvideoState();
}

class _YvideoState extends State<Yvideo> {
   final scaffoldKey = GlobalKey<ScaffoldState>();
   final   ScrollController _controller = ScrollController();
   Channel ? _channel;
  
  bool _isLoading = false;

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCGiMZec9OB25spqZU2vR-Rw');
    setState(() {
      _channel =  channel;
    });
  }
  @override
  void initState() {
    super.initState();
    _initChannel();
  }



  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      ////////////////////////////////////////////
      ///
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel!.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel!.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

              ],
            ),
/////////////////////////////////////////////////            
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:  Color.fromRGBO(28, 195, 178, 0.9),
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
     _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
        key: scaffoldKey,
        drawer:MainDrawer(),
          body: SingleChildScrollView(
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
                  left: 20.0,
                  right: 20.0,
                  child: CustomElevation(
                    child: Container(padding: const EdgeInsets.only(top: 20,left: 6, right: 6),
                    child:_channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos.length != int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              
                
                child: ListView.builder(
                 
                  itemCount: 1 + _channel!.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return _buildProfileInfo();
                    }
                    Video video = _channel!.videos[index - 1];
                    return _buildVideo(video);
                  },
                ),
              
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
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

               const Positioned(
                  top: 210,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Center(child: Text('فديوهاتنا',style:  TextStyle(fontSize: 25,color: Colors.black, fontFamily: 'el-messiri-cufonfonts',),textDirection: TextDirection.rtl,))
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
      blurRadius: 6,
      offset: Offset(10,-7), 
      // changes position of shadow
    ),
  ],
),
      child: child,
    );
  }
}
