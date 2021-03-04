import 'package:ebeep_ui/shared.dart';
import 'package:flutter/material.dart';
import 'package:ebeep_ui/widgets.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EBBottomAppBar(
        selectedItemIndex: 0,
        items: [
          EBBottomAppBarItem(iconData: Icons.event_seat, text: 'Booking'),
          EBBottomAppBarItem(
              iconData: Icons.playlist_add_check, text: 'Check-in'),
          EBBottomAppBarItem(iconData: Icons.insert_chart, text: 'Analytics'),
          EBBottomAppBarItem(iconData: Icons.people, text: 'Manage'),
        ],
        onTabSelected: print,
        backgroundColor: EBColors.quaternary,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => null,
        ),
        title: Text('EventBeep'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
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
          EBSpacers.height16,
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Cool',
            ),
          ),
          EBSpacers.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Click here', style: EBTextStyles.button),
                onPressed: () => null,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.message, color: EBColors.white),
                label: const Text('Click here', style: EBTextStyles.button),
                onPressed: () => null,
              ),
            ],
          ),
          EBSpacers.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                child: const Text('Click here'),
                onPressed: () => null,
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.message),
                label: const Text('Click here'),
                onPressed: () => null,
              ),
            ],
          ),
          EBSpacers.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: const Text('Click here'),
                onPressed: () => null,
              ),
              TextButton.icon(
                icon: Icon(Icons.message),
                label: const Text('Click here'),
                onPressed: () => null,
              ),
            ],
          ),
          EBSpacers.height16,
          DefaultTabController(
            length: 3,
            child: TabBar(tabs: [
              Tab(text: 'The Good'),
              Tab(text: 'The Bad'),
              Tab(text: 'The Ugly'),
            ]),
          ),
          EBSpacers.height16,
          EBSpacers.height16,
        ],
      ),
    );
  }
}
