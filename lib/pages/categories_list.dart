import 'package:flutter/material.dart';
import 'package:flutter_ui_12/pages/the_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'grid_item_placement.dart';

bool isPlaying = false;

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _selectedButton = 0;

  List<String> categories = [
    "Trending",
    "Dance",
    "Hip-Hop",
    "Rap",
    "Pop",
    "Hard",
  ];

  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  //What category to show depending on what button is pressed
  Widget showCategory() {
    switch (_selectedButton) {
      case 0:
        return TheGridView(
          audioPlayer: audioPlayer,
        );
      case 1:
        return GridItemPlacement(
          categories: categories,
          index: 1,
          image: "images/bgImage.jpg",
        );
      case 2:
        return GridItemPlacement(
          categories: categories,
          index: 2,
          image: "images/hip_hop.jpg",
        );
      case 3:
        return GridItemPlacement(
          categories: categories,
          index: 3,
          image: "images/rap.jpg",
        );
      case 4:
        return GridItemPlacement(
          categories: categories,
          index: 4,
          image: "images/pop.jpg",
        );
      case 5:
        return GridItemPlacement(
          categories: categories,
          index: 5,
          image: "images/randomCar.jpg",
        );
      default:
        return TheGridView(
          audioPlayer: audioPlayer,
        );
    }
  }

  Widget buttonsToShow(AsyncSnapshot snapshot) {
    final playerState = snapshot.data;
    final processingState = playerState?.processingState;
    final playing = playerState?.playing;

    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color.fromARGB(234, 0, 0, 0),
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(10),
          ),
        ),
        height: 75,
        child: const CircularProgressIndicator(),
      );
    } else if (playing != true) {
      return isPlaying
          ? Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromARGB(234, 0, 0, 0),
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(10),
                ),
              ),
              height: 75,
              child: IconButton(
                icon: const Icon(Icons.play_arrow_rounded),
                iconSize: 64.0,
                onPressed: audioPlayer.play,
              ),
            )
          : Container();
    } else if (processingState != ProcessingState.completed) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color.fromARGB(234, 0, 0, 0),
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(10),
          ),
        ),
        height: 75,
        child: IconButton(
          icon: const Icon(Icons.pause),
          iconSize: 64.0,
          onPressed: audioPlayer.pause,
        ),
      );
    } else {
      return Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: const Color.fromARGB(234, 0, 0, 0),
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
          ),
          height: 75,
          child: IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 64.0,
            onPressed: () => audioPlayer.seek(Duration.zero),
          ));
    }
  }

  //IF 1st item is pressed make it a scrollview if not don't make it scrollable
  @override
  Widget build(BuildContext context) {
    return _selectedButton == 0
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: WhatToShow(),
                ),
              ),
              StreamBuilder<PlayerState>(
                  stream: audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    return buttonsToShow(snapshot);
                  }),
            ],
          )
        : WhatToShow();
  }

  Column WhatToShow() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...categories.map(
                (category) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor:
                            _selectedButton == categories.indexOf(category)
                                ? Colors.white
                                : null),
                    onPressed: () {
                      setState(() {
                        _selectedButton = categories.indexOf(category);
                      });
                    },
                    child: Text(
                      category,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        showCategory(),
      ],
    );
  }
}
