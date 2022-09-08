import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pollfish/flutter_pollfish.dart';
import 'package:zpay/adgate.dart';
import 'package:zpay/adgem.dart';
import 'package:zpay/cpx.dart';
import 'package:zpay/login.dart';
import 'package:zpay/offerdady.dart';
import 'package:zpay/offertoro.dart';
import 'package:zpay/ptc.dart';
import 'package:zpay/withdraw.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// Pollfish basic configuration options
const String androidApiKey = "54923298-c2d3-4a5f-9eb7-04a5c89c2ace";
const String iOSApiKey = 'IOS_API_KEY';
const bool releaseMode = false;

class _MyAppState extends State<MyApp> {
  String _logText = '';

  bool _showButton = false;
  bool _completedSurvey = false;
  int _currentIndex = 0;
  int _cpa = 0;
  bool offerwallMode = false;

  @override
  void initState() {
    super.initState();
    initPollfish();
  }

  @override
  void dispose() {
    FlutterPollfish.instance.removeListeners();
    super.dispose();
  }

  Future<void> initPollfish() async {
    String logText = 'Initializing Pollfish...';

    _showButton = false;
    _completedSurvey = false;

    final offerwallMode = _currentIndex == 2;

    // Note: If you are targeting iOS 14+ devices please keep in mind that Pollfish surveys can work
    // with or without the IDFA permission on iOS 14+. If no permission is granted in the ATT popup,
    // the SDK will serve non personalized surveys to the user. In that scenario the conversion is expected to be lower.
    // Offerwall integrations perform better compared to single survey integrations when no IDFA permission is given
    // We recommend requesting IDFA usage permission prior to Pollfish initialization.

    if (_currentIndex == 1) {
      FlutterPollfish.instance.init(
          androidApiKey: androidApiKey,
          iosApiKey: iOSApiKey,
          rewardMode: true,
          releaseMode: releaseMode,
          offerwallMode: true);
    }

    FlutterPollfish.instance
        .setPollfishSurveyReceivedListener(onPollfishSurveyReceived);

    FlutterPollfish.instance
        .setPollfishSurveyCompletedListener(onPollfishSurveyCompleted);

    FlutterPollfish.instance.setPollfishOpenedListener(onPollfishOpened);

    FlutterPollfish.instance.setPollfishClosedListener(onPollfishClosed);

    FlutterPollfish.instance
        .setPollfishSurveyNotAvailableListener(onPollfishSurveyNotAvailable);

    FlutterPollfish.instance
        .setPollfishUserRejectedSurveyListener(onPollfishUserRejectedSurvey);

    FlutterPollfish.instance
        .setPollfishUserNotEligibleListener(onPollfishUserNotEligible);

    setState(() {
      _logText = logText;
    });
  }

  _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.card_giftcard),
            title: findCurrentTitle(_currentIndex),
            actions: [
              InkWell(
                  onTap: () {
                    _signOut();
                  },
                  child: Icon(Icons.logout))
            ],
          ),
          body: Center(
              child: new Container(
                  padding: new EdgeInsets.all(20.0),
                  child: new Column(children: <Widget>[
                    _currentIndex == 1
                        ? Text('$_logText\n')
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                                child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hello user",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 151, 151, 151)),
                                        ),
                                        Text(
                                          "Account type : Free",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 110,
                                  child: Card(
                                    elevation: 10,
                                    child: Container(
                                      color: Color.fromARGB(255, 203, 222, 237),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              "https://cdn.pixabay.com/photo/2016/01/25/01/52/dollar-1159943_1280.png",
                                              height: 60,
                                              width: 80,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  "Account Balance : 0.0 \$",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Withdraw()));
                                                  },
                                                  child: Text("Withdraw"))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                    child: Text(
                                  "Earn More",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 23, 118, 15)),
                                )),
                                SizedBox(
                                  height: 19,
                                ),
                                new SizedBox(
                                  width: 400.0,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    child: Text('PTC Ads'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PTC()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                new SizedBox(
                                  width: 400.0,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    child: Text('Offerdady'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OfferDady()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                new SizedBox(
                                  width: 400.0,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    child: Text('Offertoro'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Offertoro()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                new SizedBox(
                                  width: 400.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    child: Text('Adgem'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Adgem()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                new SizedBox(
                                  width: 400.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    child: Text('AdgateMedia'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Adgate()));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                new SizedBox(
                                  width: 400.0,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    child: Text('CPX Survey'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CPX()));
                                    },
                                  ),
                                ),
                              ],
                            )),
                          ),
                    (_showButton && !_completedSurvey)
                        ? new RawMaterialButton(
                            onPressed: () {
                              FlutterPollfish.instance.show();
                            },
                            child: new Text(
                                (_currentIndex == 0)
                                    ? 'Complete a Survey and Earn Credits'
                                    : 'Offerwall - Take Surveys',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                            shape: new RoundedRectangleBorder(),
                            elevation: 2.0,
                            fillColor: Colors.blue,
                            padding: const EdgeInsets.all(15.0),
                          )
                        : (_currentIndex % 2 == 1 &&
                                !_showButton &&
                                _completedSurvey)
                            ? Container(
                                child: new Text('You earned $_cpa Credits'),
                              )
                            : Container()
                  ]))),
          bottomNavigationBar: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                new BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard),
                  label: 'Dashbord',
                ),
                new BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer), label: 'Offerwall')
              ])),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    initPollfish();
  }

  Text findCurrentTitle(int currentIndex) {
    if (_currentIndex == 0) {
      return const Text('Dashbord');
    } else {
      return const Text('Pollfish Survey');
    }
  }

  // Pollfish notification functions

  void onPollfishSurveyReceived(SurveyInfo? surveyInfo) => setState(() {
        if (surveyInfo == null) {
          _logText = 'Offerwall Ready';
        } else {
          _logText =
              'Survey Received: - ${surveyInfo.toString().replaceAll("\n", " ")}';
          _cpa = surveyInfo.surveyCPA ?? 0;
        }

        print(_logText);

        _completedSurvey = false;
        _showButton = true;
      });

  void onPollfishSurveyCompleted(SurveyInfo? surveyInfo) => setState(() {
        _logText = 'Survey Completed: - ${surveyInfo.toString()}';

        print(_logText);

        if (_currentIndex == 1) {
          _showButton = false;
          _completedSurvey = true;
        }
      });

  void onPollfishOpened() => setState(() {
        _logText = 'Survey Panel Open';

        print(_logText);
      });

  void onPollfishClosed() => setState(() {
        _logText = 'Survey Panel Closed';

        print(_logText);
      });

  void onPollfishSurveyNotAvailable() => setState(() {
        _logText = 'Survey Not Available';

        print(_logText);

        _showButton = false;
        _completedSurvey = false;
      });

  void onPollfishUserRejectedSurvey() => setState(() {
        _logText = 'User Rejected Survey';

        print(_logText);

        if (_currentIndex == 1) {
          _showButton = false;
          _completedSurvey = false;
        }
      });

  void onPollfishUserNotEligible() => setState(() {
        _logText = 'User Not Eligible';

        print(_logText);

        if (_currentIndex == 1) {
          _showButton = false;
          _completedSurvey = false;
        }
      });
}
