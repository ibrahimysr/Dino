import 'package:flutter/material.dart';

class Dino extends StatelessWidget {
  late double dinoX;
  late double dinoY;
  late double DinoWith;
  late double DinoHeight;

  Dino({
    required this.dinoX,
    required this.dinoY,
    required this.DinoWith,
    required this.DinoHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * dinoX + DinoWith) / (2 - DinoWith),
          (1.3 * dinoY + DinoHeight) / (2 - DinoHeight)),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          fit: BoxFit.fill,  
            image: AssetImage("assets/DinoRed.png"))
        ),
          height: MediaQuery.of(context).size.height * 1.2 / 3 * DinoHeight,
          width: MediaQuery.of(context).size.width * DinoWith / 2,
          ),
    );
  }
}
