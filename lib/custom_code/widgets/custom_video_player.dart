// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
    this.width,
    this.height,
    this.url,
  });

  final double? width;
  final double? height;
  final String? url;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  final String _defaultVideoUrl =
      'https://d-id-clips-prod.s3.us-west-2.amazonaws.com/google-oauth2%7C110655671625147012748/clp_f8Knwjo7CgLJF2QyxRKPy/amy-Aq6OmGZnMt.mp4?AWSAccessKeyId=AKIA5CUMPJBIJ7CPKJNP&Expires=1734349585&Signature=VxamsvHLW3%2FB2oDX5WhG%2Bc4pTiE%3D';

  @override
  void initState() {
    super.initState();
    // Always initialize with the default video URL
    _initializeController(_defaultVideoUrl);
  }

  void _initializeController(String videoUrl) {
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });

        // Play the video automatically after initialization
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.hasError) {
        debugPrint("Video player error: ${_controller.value.errorDescription}");
      }

      // Reset playback when the video finishes
      if (_controller.value.position == _controller.value.duration) {
        setState(() {
          FFAppState().isVideoPlaying = false;
        });
        _controller.pause();
      }
    });
  }

  void _switchVideo(String videoUrl) {
    _controller.pause();
    _controller.dispose();
    setState(() {
      _isInitialized = false;
    });
    _initializeController(videoUrl);
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_isInitialized) {
      // Determine the video source based on isVideoPlaying
      final newVideoUrl = FFAppState().isVideoPlaying
          ? (widget.url?.isNotEmpty ?? false ? widget.url! : _defaultVideoUrl)
          : _defaultVideoUrl;

      // Switch the video if the data source has changed
      if (_controller.dataSource != newVideoUrl) {
        _switchVideo(newVideoUrl);
      }

      // Ensure the video plays or pauses based on isVideoPlaying
      if (FFAppState().isVideoPlaying) {
        _controller.play();
      } else {
        _controller.play(); // Play default video when `isVideoPlaying` is false
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_controller.value.hasError) {
      return Center(
        child: Text(
          'Unable to load video.',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Toggle mute state
              _controller.setVolume(_controller.value.volume > 0 ? 0 : 1);
              setState(() {});
            },
            child: Icon(
              _controller.value.volume > 0 ? Icons.volume_up : Icons.volume_off,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
