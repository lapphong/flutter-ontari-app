import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/details/widgets/items_course.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:video_player/video_player.dart';

import '../../../assets/assets_path.dart';


class PlayingCoursePage extends StatefulWidget {
  //final ModelCourse modelCourse;
  final int index;

  const PlayingCoursePage({
    Key? key,
    //required this.modelCourse,
    this.index = 0,
  }) : super(key: key);

  @override
  State<PlayingCoursePage> createState() => _PlayingCoursePageState();
}

class _PlayingCoursePageState extends State<PlayingCoursePage> {
  bool _playArea = false;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    _initializePlayer();
    super.initState();
  }

  Future<void> _initializePlayer() async {
    if (mounted) {
      _videoPlayerController = VideoPlayerController.asset(AssetPath.video);

      await _videoPlayerController.initialize();
      _createChewieController();
    }
  }

  _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: true,
      allowedScreenSleep: false,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  Widget _playView(BuildContext context) {
    final controller = _chewieController;
    if (controller.videoPlayerController.value.isInitialized &&
        controller.isPlaying) {
      return SizedBox(
        height: 250,
        child: Chewie(controller: controller),
      );
    } else {
      return const Text('Loading...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _playArea
                  ? _playView(context)
                  : Stack(
                      children: [
                        Image.asset(
                          courseItem[widget.index].iconUrl,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 98.0),
                          child: Center(
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: CircleButton(
                                widthIcon: 24,
                                heightIcon: 24,
                                bgColor: DarkTheme.white.withOpacity(0.6),
                                assetPath: AssetPath.iconPlay,
                                onTap: () {
                                  setState(() {
                                    if (_playArea == false) {
                                      _playArea = true;
                                      _chewieController.play();
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 214, right: 24.0, bottom: 16),
                            child: SizedBox(
                              width: 38,
                              height: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: DarkTheme.white.withOpacity(0.6),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  '10:09',
                                  style: TxtStyle.textTimeCourse,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClassicButton(
                            onTap: () {},
                            width: 132,
                            radius: 10,
                            widthRadius: 0.0,
                            colorRadius: DarkTheme.yellow.withOpacity(0.1),
                            height: 32,
                            color: DarkTheme.yellow.withOpacity(0.1),
                            child: Center(
                                child: Text(
                              courseItem[widget.index].part!.toUpperCase(),
                              style: TxtStyle.textCourse,
                            )),
                          ),
                          Image.asset(
                            AssetPath.iconMore,
                            fit: BoxFit.cover,
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      courseItem[widget.index].title,
                      maxLines: 1,
                      style: TxtStyle.headline2BoldWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 16),
                      child: Row(
                        children: [
                          const Text(
                            'James Haritz',
                            style: TxtStyle.headline5MediumWhite2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: DarkTheme.greyScale500,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          const Text(
                            'Teaching Psychology',
                            style: TxtStyle.headline5MediumWhite2,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text:
                            'In this meeting i want introduce myself and talk\nabout this course about social psychology. Th...\n',
                        style: TxtStyle.headline5MediumWhite,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Show All',
                            style: TxtStyle.headline4blue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                        color: DarkTheme.greyScale50.withOpacity(0.8),
                      ),
                    ),
                    widget.index == courseItem.length - 1
                        ? const Text(
                            'THE END',
                            style: TxtStyle.indicatorActivity,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Next Video',
                                style: TxtStyle.headline3SemiBoldWhite,
                              ),
                              const SizedBox(height: 16),
                              buildListDownloadVideo(
                                  courseItem, widget.index + 1),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListDownloadVideo(List<ModelCourse> list, int indexSent) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length - indexSent,
      itemBuilder: (context, index) {
        index = indexSent++;
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ItemsCourse(
            onTap: () {
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
              //_playView(context);
            },
            assetName: list[index].iconUrl,
            time: list[index].time,
            part: list[index].part,
            title: list[index].title,
          ),
        );
      },
    );
  }
}
