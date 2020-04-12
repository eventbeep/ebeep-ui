import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';
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
      appBar: const EBAppBar(
        // leading:
        //     IconButton(icon: Icon(Icons.arrow_back), onPressed: () => null),
        title: 'EventBeep is the best app in the entire universe',
        isMultiline: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.add),
      ),
      body: ListView(
        padding: EBPadding.horizontalXL,
        children: <Widget>[
          const Text('Amazing', style: EBTextStyles.headline1),
          const Text('Amazing', style: EBTextStyles.headline2),
          const Text('Amazing', style: EBTextStyles.headline3),
          const Text('Amazing', style: EBTextStyles.headline4),
          const Text('Amazing', style: EBTextStyles.headline5),
          const Text('Amazing', style: EBTextStyles.headline6),
          const Text('Amazing', style: EBTextStyles.subtitle1),
          const Text('Amazing', style: EBTextStyles.subtitle2),
          const Text('Amazing', style: EBTextStyles.bodyText1),
          const Text('Amazing', style: EBTextStyles.bodyText2),
          const Text('Amazing', style: EBTextStyles.button),
          const Text('Amazing', style: EBTextStyles.caption),
          const Text('Amazing', style: EBTextStyles.overline),
          UIHelper.verticalL,
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Cool',
            ),
          ),
          UIHelper.verticalL,
          Center(
            child: RaisedButton.icon(
              icon: Icon(Icons.message, color: EBColors.white),
              label: const Text('Click here', style: EBTextStyles.button),
              onPressed: () => null,
            ),
          ),
          UIHelper.verticalL,
        ],
      ),
    );
  }
}
