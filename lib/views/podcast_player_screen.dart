import 'package:audio_player_demo/providers/models/MusicViewModel.dart';
import 'package:audio_player_demo/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PodCastPlayerScreen extends StatefulWidget {
  final int index;

  const PodCastPlayerScreen(this.index, {Key? key}) : super(key: key);

  @override
  State<PodCastPlayerScreen> createState() => _PodCastPlayerScreenState();
}

class _PodCastPlayerScreenState extends State<PodCastPlayerScreen> {
  late MusicViewModel musicModel;

  @override
  void dispose() {
    musicModel.player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("INDEX: From Home Screen -->" + widget.index.toString());

    musicModel = Provider.of<MusicViewModel>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: CustomColor.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 30),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: CustomColor.white,
                        size: 22,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 5, bottom: 20),
                    child: Text(
                      musicModel.audioList[musicModel.index].musicTitle,
                      style: TextStyle(
                        color: CustomColor.white,
                        fontSize: 20,
                        fontFamily: "Manrope-ExtraBold"
                      ),
                    ),
                  ),
                ],
              ),

              // Cover Image
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: PhysicalModel(
                    color: CustomColor.grey_light,
                    shadowColor: CustomColor.white,
                    elevation: 10,
                    child: Image.asset(
                      musicModel.audioList[musicModel.index].musicPath,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              // Player Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: CustomColor.black_light,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.replay_circle_filled,
                            color: CustomColor.white,
                            size: 30,
                          ),
                          onTap: () {
                            musicModel.replayAudio();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: InkWell(
                            child: Icon(
                              Icons.skip_previous,
                              color: CustomColor.white,
                              size: 30,
                            ),
                            onTap: () {
                              musicModel.playPreviousAudio();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: InkWell(
                            child: musicModel.showStopButton
                                ? Icon(
                                    Icons.stop_circle_outlined,
                                    color: CustomColor.white,
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.play_circle,
                                    color: CustomColor.white,
                                    size: 30,
                                  ),
                            onTap: () {
                              print(musicModel.player.playing);

                              if (musicModel.player.playing) {
                                musicModel.stopAudio();
                              } else {
                                musicModel.playAudio();
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: InkWell(
                            child: Icon(
                              Icons.skip_next,
                              color: CustomColor.white,
                              size: 30,
                            ),
                            onTap: () {
                              musicModel.playNextAudio();
                            },
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.shuffle_outlined,
                            color: CustomColor.white,
                            size: 30,
                          ),
                          onTap: () {
                            musicModel.shufflePlaylist();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
