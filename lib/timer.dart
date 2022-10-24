import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Flowmenu extends StatefulWidget {
  const Flowmenu({Key? key}) : super(key: key);

  @override
  State<Flowmenu> createState() => _FlowmenuState();
}

class _FlowmenuState extends State<Flowmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('hello')),
      body: Flow(
          delegate: MyFlowDelegate(),
          children: const [Icon(Icons.add), Icon(Icons.home)]),
    );
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

class MyFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {}
  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegatet) {
    throw UnimplementedError();
  }
}


// class Flowmenu extends StatefulWidget {
//   Flowmenu({Key? key}) : super(key: key);

//   @override
//   State<Flowmenu> createState() => _FlowmenuState();
// }

// class _FlowmenuState extends State<Flowmenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Flow(
//         delegate: MyFlowDelegate(),
//         children: [Icon(Icons.add), Icon(Icons.home)]);
//   }
// }

// @override
// State<StatefulWidget> createState() {
//   // TODO: implement createState
//   throw UnimplementedError();
// }

// class MyFlowDelegate extends FlowDelegate {
//   @override
//   void paintChildren(FlowPaintingContext context) {}
//   @override
//   bool shouldRepaint(covariant FlowDelegate oldDelegatet) {
//     throw UnimplementedError();
//   }
// }
