// import 'package:eventbeep_ui/shared/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubePlayerPage extends StatefulWidget {
//   const YoutubePlayerPage({Key key, this.videoId}) : super(key: key);
//   final String videoId;

//   @override
//   _YoutubePlayerPageState createState() => _YoutubePlayerPageState();
// }

// class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
//   YoutubePlayerController _controller;
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         forceHideAnnotation: true,
//       ),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayer(
//       controller: _controller,
//       showVideoProgressIndicator: true,
//       progressIndicatorColor: BeepColors.primary,
//       progressColors: ProgressBarColors(
//         playedColor: BeepColors.primary,
//         handleColor: BeepColors.primary250,
//       ),
//       onReady: () {
//         print('Player is ready.');
//       },
//     );
//   }
// }
