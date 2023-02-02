import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  late bool Gameover;

  GameOver({required this.Gameover});

  @override
  Widget build(BuildContext context) {
    return Gameover
        ? Stack(
            children: [
              Container(
                alignment: Alignment(0, -0.2),
                child: Image.asset(
                  "assets/gameover.png",
                  width: 220,
                ),
              ),
            ],
          )
        : Container();
  }
}
