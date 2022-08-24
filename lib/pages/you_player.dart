import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Yplayer extends StatefulWidget {
  String link;

  // receive data from the FirstScreen as a parameter
  Yplayer(this.link);

  @override
  State<Yplayer> createState() => _YplayerState();
}

class _YplayerState extends State<Yplayer> {
  final TextEditingController _textEditingController = TextEditingController();

   YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController=
    YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.link),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
      ),
      builder: (context, player) {
        return Scaffold(
          body: Column(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: widget.link,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  youtubePlayerController.load(
                    YoutubePlayer.convertUrlToId(_textEditingController.text),
                  );
                },
                child: Text("Play Video"),
              ),
            ],
          ),
        );
      },
    );
  }
}
