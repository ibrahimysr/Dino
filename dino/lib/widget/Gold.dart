import 'package:flutter/material.dart';

class Gold extends StatelessWidget {
  late double GoldX;
  late double GoldY;
  late double GoldWith;
  late double GoldHeight;
  

  Gold(
      {required this.GoldX,
      required this.GoldY,
      required this.GoldWith,
      required this.GoldHeight,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * GoldX + GoldWith) / (2 - GoldWith),
          (1.3 * GoldY + GoldHeight) / (2 - GoldHeight)),
      child: Container(
          height: MediaQuery.of(context).size.height * 1.2 / 3 * GoldHeight,
          width: MediaQuery.of(context).size.width * GoldWith / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/gold.png",
              fit: BoxFit.fill,
            ),
          )

          //Image.asset("assets/rex.png", fit: BoxFit.fill),
          ),
    );
  }
}
