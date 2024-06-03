import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(VideoPlayer(_controller),);
  }
}
