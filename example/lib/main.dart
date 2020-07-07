import 'package:animated_clipper/animated_clipper.dart';
import 'package:animated_clipper_example/simple_box.dart';
import 'package:flutter/material.dart';

import 'animated_clip_reveal_example.dart';
import 'animated_cross_clip_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Clipper Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Animated Clipper Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _bool = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleBool(bool newValue) {
    setState(() {
      _bool = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ClipSwitch
                Text('ClipSwitch can be tapped'),
                Text('(you must manage the state, just like Switch)'),
                SizedBox(height: 12),
                ClipSwitch(
                  value: _bool,
                  onChanged: _toggleBool,
                  inactiveWidget: SimpleBox(text: 'OFF', color: Colors.black),
                  activeWidget: SimpleBox(text: 'ON', color: Colors.blue),
                ),
                SizedBox(height: 12),
                // AnimatedCrossClip
                Text('AnimatedCrossClip toggles between two widgets'),
                Text('(these use the same state value as above)'),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedCrossClipExample(
                      value: _bool,
                      pathBuilder: PathBuilders.splitHorizontalIn,
                    ),
                    SizedBox(width: 12),
                    AnimatedCrossClipExample(
                      value: _bool,
                      pathBuilder: PathBuilders.splitVerticalOut,
                    ),
                    SizedBox(width: 12),
                    AnimatedCrossClipExample(
                      value: _bool,
                      pathBuilder: PathBuilders.circleIn,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // AnimatedClipReveal
                Text('AnimatedClipReveal reveals the child as it changes'),
                Text('You have pushed the button this many times:'),
                SizedBox(height: 12),
                AnimatedClipRevealExample(value: _counter),
                SizedBox(height: 12),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
