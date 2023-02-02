import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  late bool gameHasStarded;

  Start({required this.gameHasStarded});

  @override
  Widget build(BuildContext context) {
    return gameHasStarded
        ? Container()
        : Stack(
            children: [
              Container(
                alignment: Alignment(0, -0.1),
                child: Image.asset(
                  "assets/start_game.png",
                  width: 160,
                ),
              ),
            ],
          );
  }
}
