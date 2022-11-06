import 'package:audio_player_demo/providers/data/music_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicViewModel extends ChangeNotifier {
  final player = AudioPlayer();
  var audioList = musicList;
  late int index;
  bool showStopButton = false;

  void initPlayer() {
    var playlist = ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      // shuffleOrder: DefaultShuffleOrder(),
      // Specify the playlist items
      children: [
        AudioSource.uri(Uri.parse('asset:///${audioList[0].song}')),
        AudioSource.uri(Uri.parse('asset:///${audioList[1].song}')),
        AudioSource.uri(Uri.parse('asset:///${audioList[2].song}')),
        AudioSource.uri(Uri.parse('asset:///${audioList[3].song}')),
        AudioSource.uri(Uri.parse('asset:///${audioList[4].song}')),
      ],
    );

    player.setAudioSource(playlist);
  }

  void setInitAudio(int position) {
    index = position;
    player.seek(Duration(), index: position);
    player.play();
    notifyStopButton(true);
    notifyListeners();
  }


  void playAudio() {
    player.play();
    notifyStopButton(true);
    notifyListeners();
  }

  void stopAudio() {
    player.stop();
    notifyStopButton(false);
    notifyListeners();
  }

  void playNextAudio() async {
    await player.seekToNext();
    index = player.currentIndex!;
    notifyStopButton(true);
    await player.play();
    notifyListeners();
  }

  void playPreviousAudio() async {
    await player.seekToPrevious();
    index = player.currentIndex!;
    notifyStopButton(true);
    await player.play();
    notifyListeners();
  }

  void shufflePlaylist() async {
    //TODO - Not Implemented
  }

  void replayAudio() async {
    if (player.playing) {
      await player.stop();
    }

    notifyStopButton(true);
    await player.play();
    notifyListeners();
  }

  void notifyStopButton(bool value){
    showStopButton = value;
    notifyListeners();
  }
}
