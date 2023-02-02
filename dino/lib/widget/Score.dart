import 'dart:ui';

import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  late final score;
  late final bestscore;
  late final goldscore;

  Score(
      {required this.score, required this.bestscore, required this.goldscore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/score.png",
                width: 60,
              ),
              Text(
                score.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.orange),
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                "assets/goldscore.png",
                width: 60,
              ),
              Text(
                goldscore,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.orange),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                "assets/top.png",
                width: 60,
              ),
              Text(
                bestscore.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.orange),
              )
            ],
          ),
        ],
      ),
    );
  }
}
