import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  late double BarrierX;
  late double BarrierY;
  late double BarrierWith;
  late double BarrierHeight;
  late String resim;

  Barrier(
      {required this.BarrierX,
      required this.BarrierY,
      required this.BarrierWith,
      required this.BarrierHeight,
      required this.resim});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * BarrierX + BarrierWith) / (2 - BarrierWith),
          (1.3 * BarrierY + BarrierHeight) / (2 - BarrierHeight)),
      child: Container(
          height: MediaQuery.of(context).size.height * 1.2 / 3 * BarrierHeight,
          width: MediaQuery.of(context).size.width * BarrierWith / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/$resim.png",
              fit: BoxFit.fill,
            ),
          )

          //Image.asset("assets/rex.png", fit: BoxFit.fill),
          ),
    );
  }
}
