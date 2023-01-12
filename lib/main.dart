import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whimsical App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0B0707),
      ),
      home: const ButtonView(),


    );
  }
}

class ButtonView extends StatefulWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  _ButtonViewState createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  Color connectButtonColor = Colors.blue;
  Color startButtonColor = Colors.green;
  Color stopButtonColor = Colors.red;
  final String startText = "START";
  final String stopText = "STOP";
  final String connectText = "CONNECT";

  bool isClicked = false;

  void onChanged() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(
                centerTitle: true,
                title: const Text(
                    'Whimsical App',
                    textScaleFactor: 1.5,
                )

            ),

            //TODO: when wifi is connected wifi signal turns on
              const Visibility(
                visible: true,
                  child: Icon(Icons.wifi,color:Colors.red)
              ),

            const Spacer(flex:1),

            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.5,

              child: ElevatedButton(
                onPressed: () {
                  //TODO: click event
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                child: Text(connectText,textScaleFactor: 1.5,),

              ),
            ),

            const Spacer(flex: 1),

            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  //TODO
                  onChanged();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isClicked ? stopButtonColor : startButtonColor),
                child: Text(isClicked ? stopText : startText, textScaleFactor: 1.5,),
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}