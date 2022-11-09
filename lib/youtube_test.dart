import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlay extends StatefulWidget {
  const YoutubePlay({super.key});

  @override
  State<YoutubePlay> createState() => _YoutubePlayState();
}

class _YoutubePlayState extends State<YoutubePlay> {
  @override
  Widget build(BuildContext context) {
    var youtubecontroller = YoutubePlayerController();

    return YoutubePlayerControllerProvider(
      controller: youtubecontroller,
      child: Scaffold(
        appBar: AppBar(title: const Text('data')),
        body: const YoutubePlayer(),
      ),
    );
  }
}
