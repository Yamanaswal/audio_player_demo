import 'package:audio_player_demo/components/music_Image_card.dart';
import 'package:audio_player_demo/providers/models/MusicViewModel.dart';
import 'package:audio_player_demo/resources/colors.dart';
import 'package:audio_player_demo/views/podcast_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final musicModel = Provider.of<MusicViewModel>(context, listen: false);
    musicModel.initPlayer();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.black,
          centerTitle: true,
          title: Text(
            "Music App",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Manrope-ExtraBold",
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: CustomColor.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/image_one.jpg"),
                            radius: 50),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              "My Playlist",
                              style: TextStyle(
                                color: CustomColor.white,
                                fontSize: 18,
                                fontFamily: "Monrope-Bold",
                              ),
                            ),
                          ),
                          Text(
                            "Demo Songs",
                            style: TextStyle(
                              color: CustomColor.white,
                              fontSize: 16,
                              fontFamily: "Manrope-Bold.ttf",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                // Body
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "PodCast - Music Songs",
                    style: TextStyle(
                      color: CustomColor.white,
                      fontSize: 20,
                      fontFamily: "Manrope-SemsiBold"
                    ),
                  ),
                ),

                Container(
                  height: 220,
                  alignment: Alignment.center,
                  // color: Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    itemCount: musicModel.audioList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return MusicImageCard(musicModel.audioList[index],
                          onTap: () {
                        musicModel.setInitAudio(index);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PodCastPlayerScreen(index)));
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
