import 'package:animated_clipper/animated_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text('hello'),
          OrangeOrBlack(counter: _counter),
          AllTheNumbers(counter: _counter),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class AllTheNumbers extends StatelessWidget {
  const AllTheNumbers({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      child: Container(
        key: Key('$_counter'),
        width: 100,
        height: 100,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        child: Text('$_counter', style: Theme.of(context).textTheme.headline4),
      ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ClipPathTransition(
          animation: animation,
          child: child,
          pathBuilder: PathBuilderSplitHorizontalOut(),
        );
      },
    );
  }
}

class OrangeOrBlack extends StatelessWidget {
  const OrangeOrBlack({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossClip(
      duration: Duration(milliseconds: 300),
      pathBuilder: PathBuilderSplitHorizontalIn(),
      firstChild: Container(
        width: 100,
        height: 100,
        color: Colors.orangeAccent,
      ),
      secondChild: Container(
        width: 100,
        height: 100,
        color: Colors.black,
      ),
      crossClipState: _counter.isEven
          ? AnimatedCrossClipState.showFirst
          : AnimatedCrossClipState.showSecond,
      curve: Curves.easeInOut,
      clipBehavior: Clip.hardEdge,
    );
  }
}
