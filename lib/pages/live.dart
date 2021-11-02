import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Live extends StatefulWidget {
 static const route = '/Live';

  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
    late YoutubePlayerController _controller;
 late  TextEditingController _idController;
 late  TextEditingController _seekToController;

   late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    't8iVRlq6AjU',
    '0q6WV6VS4gs',
    '6tgXf4IfR9I',
    'qBGueen_wE8',
    'HPYZQAX-jmI',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                log('Settings Tapped!');
              },
            ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            _controller
                .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
            _showSnackBar('Next Video Started!');
          },
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(28, 195, 178, 0.9),
            title:  const Text(
                'مشغل البث المباشر',
                style: TextStyle(color: Colors.white),textDirection: TextDirection.rtl,
              ),
            
      
          ),
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
            child: ListView(
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _space,
                      _text('العنوان', _videoMetaData.title),
                      _space,
                      _text('اسم القناة', _videoMetaData.author),
                      _space,
                      _space,
                      TextField(
                        enabled: _isPlayerReady,
                        controller: _idController,
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          border: InputBorder.none,
                          hintText: 'ادخل عنوان او رابط البث المباشر الذي تريد مشاهدته',
                          
                          fillColor: Colors.blueAccent.withAlpha(20),
                          filled: true,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(28, 195, 178, 0.9)
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _idController.clear(),
                          ),
                        ),
                      ),
                      _space,
                       _space,
                        _space,
                    
                        
                          Center(child: _loadCueButton('تشغيل البث')),
                        
                          
                        
                   
                      // _space,
                      // _space,
              
                      // _space,
                      // AnimatedContainer(
                      //   duration: const Duration(milliseconds: 800),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: _getStateColor(_playerState),
                      //   ),
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     _playerState.toString(),
                      //     style: const TextStyle(
                      //       fontWeight: FontWeight.w300,
                      //       color: Colors.white,
                      //     ),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
          }
        ),
      ),
    ));
  }

  Widget _text(String title, String value) {
    return Directionality(textDirection: TextDirection.rtl,
      child: RichText(
        text: TextSpan(
          text: '$title : ',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,fontSize: 15,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,fontSize: 13
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        
        shape: const RoundedRectangleBorder(
               side: BorderSide(color: Color.fromRGBO(28, 195, 178, 0.9)),
               borderRadius: BorderRadius.all((Radius.circular(20)))),
        color: const Color.fromRGBO(28, 195, 178, 0.9),
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}