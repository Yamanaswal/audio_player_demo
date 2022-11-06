
final musicList = <MusicItem>[
  MusicItem(1,"assets/images/image_six.jpg", "Happy Holiday" , "Music 1", "assets/audios/happy_holiday.mp3"),
  MusicItem(2,"assets/images/image_two.jpg", "Let it Go" , "Music 2", "assets/audios/let_it_go.mp3"),
  MusicItem(3,"assets/images/image_three.jpg", "Mix-It Game" , "Music 3", "assets/audios/mixkit_retro_game.wav"),
  MusicItem(4,"assets/images/image_four.jpg", "Happy Coynuty" , "Music 4", "assets/audios/happy_coyntry.mp3"),
  MusicItem(5,"assets/images/image_five.jpg", "Komm Lieber Mai Und - Overback" , "Music 5", "assets/audios/komm_lieber_mai.mp3"),
];

class MusicItem{
  int id;
  String musicPath = "";
  String musicTitle = "";
  String musicSubTitle = "";
  String song = "";

  MusicItem(this.id,this.musicPath, this.musicTitle, this.musicSubTitle, this.song);
}