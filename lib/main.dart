import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); 

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int result = 0;
  String buttonText = "START";
  GameState state = GameState.stopped;

  Timer? waitingTimer;
  Timer? runningTimer;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(children: [Align(
        alignment: Alignment.topCenter,
        child: Text("Test your\nreaction speed",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.yellow[700],
          fontSize: 25,
          )
          )
      ),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 200,
          height: 200,
          child: ColoredBox(
            color: Colors.blueGrey, 
            child: Center(
              child: ColoredBox(
              color: Colors.white, 
              child: Text("$result ms"), 
            )
          )
          )
        )
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () => _pushButton(),
          child: Text(buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.green[700],
            fontSize: 25,
            backgroundColor: Colors.black
          ) 
          )
        )
      )
      ])
    );
  }

  void _pushButton() {
    setState(() {
      if(state == GameState.stopped) {
        buttonText = "WAITING";
        result = 0;
        state = GameState.waiting;
        _startWaitingTimer();
      }
      else if(state == GameState.started) {
        buttonText = "START";
        runningTimer?.cancel();
        state = GameState.stopped;
      }   
    });
  }

  void _startWaitingTimer() {
    final int randomSeconds = Random().nextInt(4) + 1;
    Timer(Duration(seconds: randomSeconds), () { 
      setState(() {
        state = GameState.started;
        buttonText = "STOP";
      });
      
      _startRunningTimer();
      });
  }

  void _startRunningTimer() {
    final int milliseconds = 16;
    runningTimer = Timer.periodic(Duration(milliseconds: milliseconds), (timer) => setState(() => result += timer.tick * milliseconds));
  }

  @override
  void dispose() {
    waitingTimer?.cancel();
    runningTimer?.cancel();
    super.dispose();
  }
}

enum GameState {
  waiting, started, stopped 
}