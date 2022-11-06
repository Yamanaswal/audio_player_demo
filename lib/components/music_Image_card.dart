import 'package:audio_player_demo/providers/data/music_list.dart';
import 'package:audio_player_demo/resources/colors.dart';
import 'package:flutter/material.dart';

class MusicImageCard extends StatelessWidget {
  final Function() onTap;
  final MusicItem musicItem;

  const MusicImageCard(this.musicItem, {Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          // decoration: BoxDecoration(color: CustomColor.black_light),
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(8),
          height: 200,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhysicalModel(
                color: CustomColor.black,
                elevation: 12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    musicItem.musicPath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  musicItem.musicTitle,
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 16,
                    fontFamily: "Manrope-Bold",
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  musicItem.musicSubTitle,
                  style: TextStyle(
                    color: CustomColor.white,
                    fontSize: 16,
                    fontFamily: "Manrope-Medium",
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
        onTap: onTap);
  }
}
