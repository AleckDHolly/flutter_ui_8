import 'package:flutter/material.dart';
import 'package:flutter_ui_12/pages/categories_list.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../components/sub_category.dart';
import 'single_grid_item.dart';

//Shows all the categories
// ignore: must_be_immutable
class TheGridView extends StatefulWidget {
  TheGridView({super.key, required this.audioPlayer});
  AudioPlayer audioPlayer;

  @override
  State<TheGridView> createState() => _TheGridViewState();
}

class _TheGridViewState extends State<TheGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 3 / 4,
      children: [
        InkWell(
          onTap: () async {
            isPlaying = true;
            await widget.audioPlayer.setAudioSource(
              AudioSource.asset(
                "sounds/future_life.wav",
                tag: MediaItem(
                  // Specify a unique ID for each media item:
                  id: '1',
                  // Metadata to display in the notification:
                  album: "The Come Up",
                  title: "Future lifestyle",
                  artUri: Uri.directory("images/hip_hop.jpg"),
                ),
              ),
            );
            widget.audioPlayer.play();
          },
          child: SingleGridItem(
            subCategory: SubCategory(
                subCatName: "Hip-Hop",
                nowPlaying: "Kcela - Future lifestyle",
                image: "images/hip_hop.jpg"),
          ),
        ),
        InkWell(
          onTap: () async {
            isPlaying = true;
            await widget.audioPlayer.setAudioSource(
              AudioSource.asset(
                "sounds/talkingmy.wav",
                tag: MediaItem(
                  // Specify a unique ID for each media item:
                  id: '2',
                  // Metadata to display in the notification:
                  album: "The Come Up",
                  title: "Talking my \$hit",
                  artUri: Uri.directory("images/rap.jpg"),
                ),
              ),
            );
            widget.audioPlayer.play();
          },
          child: SingleGridItem(
            subCategory: SubCategory(
                subCatName: "Rap",
                nowPlaying: "Kcela - Talking my \$hit",
                image: "images/rap.jpg"),
          ),
        ),
        InkWell(
          onTap: () async {
            isPlaying = true;
            await widget.audioPlayer.setAudioSource(
              AudioSource.asset(
                "sounds/25.wav",
                tag: MediaItem(
                  // Specify a unique ID for each media item:
                  id: '3',
                  // Metadata to display in the notification:
                  album: "The Come Up",
                  title: "25",
                  artUri: Uri.directory("images/bgImage.jpg"),
                ),
              ),
            );
            widget.audioPlayer.play();
          },
          child: SingleGridItem(
            subCategory: SubCategory(
                subCatName: "Chill",
                nowPlaying: "Kcela - 25",
                image: "images/bgImage.jpg"),
          ),
        ),
        InkWell(
          onTap: () async {
            isPlaying = true;
            await widget.audioPlayer.setAudioSource(
              AudioSource.asset(
                "sounds/wrong.wav",
                tag: MediaItem(
                  // Specify a unique ID for each media item:
                  id: '4',
                  // Metadata to display in the notification:
                  album: "Everything's wrong",
                  title: "Everything's wrong",
                  artUri: Uri.directory("images/pop.jpg"),
                ),
              ),
            );
            widget.audioPlayer.play();
          },
          child: SingleGridItem(
            subCategory: SubCategory(
                subCatName: "Pop",
                nowPlaying: "Kcela - Everything's wrong",
                image: "images/pop.jpg"),
          ),
        ),
        InkWell(
          onTap: () async {
            isPlaying = true;
            await widget.audioPlayer.setAudioSource(
              AudioSource.asset(
                "sounds/1.mp3",
                tag: MediaItem(
                  // Specify a unique ID for each media item:
                  id: '5',
                  // Metadata to display in the notification:
                  album: "Chill lofi",
                  title: "Lo-Fi",
                  artUri: Uri.directory("images/lofi.jpg"),
                ),
              ),
            );
            widget.audioPlayer.play();
          },
          child: SingleGridItem(
            subCategory: SubCategory(
                subCatName: "Lo-Fi",
                nowPlaying: "Lo-Fi - Good song",
                image: "images/lofi.jpg"),
          ),
        ),
        InkWell(
          onTap: () async {
            isPlaying = true;
            await widget.audioPlayer.setAudioSource(
              AudioSource.asset(
                "sounds/life.wav",
                tag: MediaItem(
                  // Specify a unique ID for each media item:
                  id: '6',
                  // Metadata to display in the notification:
                  album: "Future Lifestyle",
                  title: "Future Lisfe",
                  artUri: Uri.directory("images/randomCar.jpg"),
                ),
              ),
            );
            widget.audioPlayer.play();
          },
          child: SingleGridItem(
            subCategory: SubCategory(
                subCatName: "Hard",
                nowPlaying: "Kcela - Future Lifestyle",
                image: "images/randomCar.jpg"),
          ),
        ),
      ],
    );
  }
}
