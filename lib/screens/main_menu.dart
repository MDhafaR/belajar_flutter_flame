import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/screens/game_play.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${Globals.background}"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "Fit Fighter",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GamePlay()));
                    },
                    child: const Text(
                      "Play",
                      style: TextStyle(fontSize: 25),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
