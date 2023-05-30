import 'package:flutter/material.dart';
//import 'dart:math';
import 'package:flutter/services.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    List ourStates = [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virginia',
      'Wisconsin',
      'Wyoming'
    ];

    ourStates.shuffle();
    String stateName = ourStates[0];
    var answer = stateName;
    String button2 = ourStates[1];
    String button3 = ourStates[2];

    List newButtons = [answer, button2, button3];
    //newButtons.shuffle();
    List newButtonsSC = newButtons.toList();
    //check for shuffle position
    newButtons.shuffle();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: const BottomAppBar(
          color: Colors.yellow,
          child: SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child:
                        Text('States\nCorrect\n0', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('States\nIncorrect\n1',
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Capitals\nCorrect\n2',
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Capitals\nIncorrect\n3',
                        textAlign: TextAlign.center),
                  ),
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: AppBar(
          title: const Text('Name The State Game'),
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
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('assets/images/states_no_name/$answer.png',
                    height: 200),
                const Text(
                  'Name this State!',
                  style: TextStyle(fontSize: 20.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (answer == newButtons[0]) {
                      Navigator.of(context)
                          .pushNamed('/correct', arguments: newButtonsSC);

                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(newButtons[0]),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (answer == newButtons[1]) {
                      Navigator.of(context)
                          .pushNamed('/correct', arguments: newButtonsSC);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(newButtons[1]),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (answer == newButtons[2]) {
                      Navigator.of(context)
                          .pushNamed('/correct', arguments: newButtonsSC);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(newButtons[2]),
                ),
              ]),
        ),
      ),
    );
  }
}
