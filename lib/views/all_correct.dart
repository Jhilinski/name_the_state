import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AllCorrectPage extends StatelessWidget {
  final _myBox = Hive.box('myBox');
  String playerName = '';
  final player = AudioPlayer();

  AllCorrectPage({Key? key}) : super(key: key);
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    bool? isAudio = (_myBox.get(2));
    final List args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    String correctState = args[0];
    String? stateCap = args[1];
    print('isAudio-ac $isAudio');
    if (isAudio != false) {
      player.play(AssetSource('success-fanfare-trumpets.mp3'));
    }
    playerName = (_myBox.get(1));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Correct Answer!'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          ElevatedButton(
            //     textColor: Colors.white,
            onPressed: () {
              closeAppUsingSystemPop();
            },
            child: const Text("Exit"),
            //     shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/states_name/$correctState.png'),
            Text(
              'You GotThe Right Answer $playerName!!\n$correctState\nState Capitol $stateCap',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text('Next State'),
              onPressed: () {
                Navigator.of(context).pushNamed('/page_one');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// © 2022 SimCon All Rights Reserved