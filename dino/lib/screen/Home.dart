import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/Barrier.dart';
import '../widget/Dino.dart';
import '../widget/Gameover.dart';
import '../widget/Gold.dart';
import '../widget/Score.dart';
import '../widget/Start.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool gameHasStarded = false;
  bool Gameover = false;
  bool centraljump = false;
  bool dinoHaspassedBarrier = false;

  int score = 0;
  int bestscore = 0;
  int goldscore = 0;

  double gravity = 10.5;
  double height = 0;
  double time = 0;
  double hiz = 6;

  double dinoX = -0.5;
  double dinoY = 1;
  double DinoWith = 0.2;
  double DinoHeight = 0.4;

  //double BarrierX = 0.5;
  List<double> BarrierX = [0.8, 2, 3.5];
  List<double> BarrierY = [1, -0.1, 1];
  double BarrierWith = 0.2;
  double BarrierHeight = 0.4;

  double GoldX = Random().nextDouble();
  double GoldY = -0.6;
  double GoldWith = 0.2;
  double GoldHeight = 0.4;
  String goldscoree = "0";

  void StartGame() {
    setState(() {
      gameHasStarded = true;
    });

    Timer.periodic(Duration(milliseconds: 12), (timer) {
      if (carpmadurumu()) {
        Gameover = true;
        timer.cancel();
        setState(() {
          if (score > bestscore) {
            setState(() {
              bestscore = score;
            });
          }
        });
      }

      map();
      uptadescore();
      uptadegoldscore();
    });
  }

  void uptadegoldscore() {
    setState(() {
      GoldX -= 0.01;
      if (GoldX <= -1.2) {
        GoldX += 1 + Random().nextDouble() * 1.5;
      }
    });
    if (GoldX < dinoX + DinoWith &&
        GoldX + GoldWith >= dinoX &&
        dinoY >= GoldY - GoldHeight &&
        GoldY + GoldHeight >= dinoY) {
      setState(() {
        GoldX += 1 + Random().nextDouble() * 1.5;

        goldscore++;
      });
    }
  }

  void uptadescore() {
    for (int i = 0; i < BarrierX.length; i++) {
      if (BarrierX[i] < dinoX && dinoHaspassedBarrier == false) {
        setState(() {
          dinoHaspassedBarrier = true;
          score++;
        });
      }
    }
  }

  void map() {
    for (int i = 0; i < BarrierX.length; i++) {
      setState(() {
        if (score >= 5) {
          BarrierX[i] -= 0.013;
        } else {
          BarrierX[i] -= 0.01;
        }
      });
    }
    if (BarrierX[0] <= -1.2) {
      BarrierX[0] = 1.3 + Random().nextDouble() * 2.5;
      dinoHaspassedBarrier = false;
    }
    if (BarrierX[1] <= -1.3) {
      BarrierX[1] = 1.4 + Random().nextDouble() * 3;
      dinoHaspassedBarrier = false;
    }
    if (BarrierX[2] <= -1.4) {
      BarrierX[2] = 1.5 + Random().nextDouble() * 3.5;
      dinoHaspassedBarrier = false;
    }
  }

  bool carpmadurumu() {
    for (int i = 0; i < BarrierX.length; i++) {
      if (BarrierX[i] < dinoX + DinoWith &&
          BarrierX[i] + BarrierWith >= dinoX &&
          dinoY >= BarrierY[i] - BarrierHeight &&
          BarrierY[i] + BarrierHeight >= dinoY) {
        return true;
      }
    }
    return false;
  }

  void jump() {
    centraljump = true;

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = -gravity / 2 * time * time + hiz * time;

      if (1 - height > 1) {
        resetJump();
        dinoY = 1;
        timer.cancel();
      } else {
        setState(() {
          dinoY = 1 - height;
        });
      }

      if (Gameover) {
        timer.cancel();
      }

      time += 0.01;
    });
  }

  void resetJump() {
    centraljump = false;
    time = 0;
  }

  void playGameagain() {
    setState(() {
      Gameover = false;
      gameHasStarded = false;
      time = 0;
      BarrierX = [0.8, 2, 3.5];
      dinoY = 1;
      centraljump = false;
      score = 0;
      GoldX = Random().nextDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: Gameover
            ? (playGameagain)
            : gameHasStarded
                ? (centraljump ? null : jump)
                : StartGame,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/background.png"))),
            child: Column(
              children: [
                Container(
                  child: Expanded(
                      flex: 2,
                      child: Center(
                        child: Stack(
                          children: [
                            Start(gameHasStarded: gameHasStarded),
                            Score(
                                score: score,
                                bestscore: bestscore,
                                goldscore: goldscore.toString()),
                            Dino(
                                dinoX: dinoX,
                                dinoY: dinoY,
                                DinoWith: DinoWith,
                                DinoHeight: DinoHeight),
                            Gold(
                                GoldX: GoldX,
                                GoldY: GoldY,
                                GoldWith: GoldWith,
                                GoldHeight: GoldHeight),
                            Barrier(
                                BarrierX: BarrierX[0],
                                BarrierY: BarrierY[0],
                                BarrierWith: BarrierWith,
                                BarrierHeight: BarrierHeight,
                                resim: "engel2"),
                            Barrier(
                              BarrierX: BarrierX[1],
                              BarrierY: BarrierY[1],
                              BarrierWith: BarrierWith,
                              BarrierHeight: BarrierHeight,
                              resim: "yarasa",
                            ),
                            Barrier(
                              BarrierX: BarrierX[2],
                              BarrierY: BarrierY[2],
                              BarrierWith: BarrierWith,
                              BarrierHeight: BarrierHeight,
                              resim: "engel3",
                            ),
                            GameOver(Gameover: Gameover)
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
