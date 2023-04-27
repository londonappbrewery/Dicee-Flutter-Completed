import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const Mainapp());

class Mainapp extends StatelessWidget {
  const Mainapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.blueGrey.shade900,
      ),
      home: const Dice(title: 'Dice'),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key, required this.title});
  final String title;
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftPic = 1;
  int rightPic = 1;
  int goingNum = 0;
  int goingNumGoo = 0;
  int value = 0;

  int goingForNumAdd() {
    setState(() {
      if (goingNum >= 0 && goingNum <= 11) {
        goingNum++;
      }
    });
    return goingNum;
  }

  int goingForNumMinus() {
    setState(() {
      if (goingNum > 0) {
        goingNum--;
      }
    });
    return goingNum;
  }

  void diceResult() {
    goingNumGoo = goingNum;
    setState(() {
      rightPic = Random().nextInt(6) + 1;

      leftPic = Random().nextInt(6) + 1;
      value = leftPic + rightPic;

      // changeDiceFaceLeft();
      // changeDiceFaceRight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Roll For ?',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    goingForNumMinus();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                Text(
                  '$goingNum',
                  style: const TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40.0,
                      color: Colors.white),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    goingForNumAdd();
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.blueGrey.shade900,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            RawMaterialButton(
              onPressed: () {
                diceResult();
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              fillColor: Colors.lightBlueAccent,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Throws',
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 30.0,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/images/dice$leftPic.png'),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/dice$rightPic.png'),
                )),
              ],
            ),
            Text(
              'Roll: $value',
              style: const TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            value == goingNum && value != 0
                ? const Text(
                    'Good Job !',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40.0,
                        color: Colors.white),
                  )
                : const Text(
                    'Lost !',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40.0,
                        color: Colors.white),
                  ),
          ],
        ),
      ),
    );
  }
}
