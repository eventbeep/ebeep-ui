import 'package:flutter/material.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';

void main() => runApp(EventbeepApp());

class EventbeepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: EBThemes.lightTheme,
      home: const MyHomePage(title: 'Eventbeep'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<String> imgList = <String>[
  'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F58655718%2F157741597574%2F1%2Foriginal.jpg?w=800&auto=compress&rect=0%2C86%2C960%2C480&s=0f59d910e3401a84aaf18bd5f6c14bd3',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Function> onItemTapList = <Function>[
  () {
    print('index 1');
  },
  () {
    print('index 2');
  },
  () {
    print('index 3');
  },
  () {
    print('index 4');
  },
  () {
    print('index 5');
  },
];

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Featured'),
    const Tab(text: 'Popular'),
    const Tab(text: 'Latest')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EBAppBar(title: 'Title'),
      floatingActionButton: EBFloatingButton(
        icon: const Icon(Icons.home),
        onPressed: () => null,
      ),
      body: ListView(
        // padding: EBPadding.horizontalXL,
        children: <Widget>[
          const Text('Amazing'),
          UIHelper.verticalL,
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          ClipPath(
            clipper: ProfileCircleClipper(holeRadius: 60),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.amber,
              ),
              height: 250,
              padding: const EdgeInsets.all(35),
              child: const Text('second example'),
            ),
          ),
        ],
      ),
    );
  }
}
