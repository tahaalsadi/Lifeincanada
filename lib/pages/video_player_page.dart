// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayer extends StatefulWidget {
//  final VideoPlayerController videoPlayerController;
//  final bool isLoop;

// const VideoPlayer({required this.isLoop,required this.videoPlayerController});

//   @override
//   _VideoPlayerState createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer> {
//   late ChewieController chewieController;

//   @override
//   void initState() {
//     chewieController= ChewieController(
//       looping: widget.isLoop,
//       aspectRatio: 16/9,
//       autoInitialize: true,
//       videoPlayerController: widget.videoPlayerController
//     );
//     super.initState();
//   }
//   @override
//   void dispose() {
//     chewieController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Chewie(controller: chewieController,),
//     );
//   }
// }

// class VideoDisplay extends StatefulWidget {
//   final String videoUrl;
//   const VideoDisplay({required this.videoUrl});

//   @override
//   _VideoDisplayState createState() => _VideoDisplayState();
// }

// class _VideoDisplayState extends State<VideoDisplay> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: VideoPlayer(
//         isLoop: true, videoPlayerController:VideoPlayerController.network(widget.videoUrl),
//       ),
//     );
//   }
// }