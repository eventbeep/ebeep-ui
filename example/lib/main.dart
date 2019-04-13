import 'package:flutter/material.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: MyHomePage(title: 'Eventbeep'),
//      home: Scaffold(
//        appBar: PreferredSize(
//            child: Container(), preferredSize: Size.fromHeight(32)),
//        body: TimelinePage(),
//      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<String> imgList = [
  'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F58655718%2F157741597574%2F1%2Foriginal.jpg?w=800&auto=compress&rect=0%2C86%2C960%2C480&s=0f59d910e3401a84aaf18bd5f6c14bd3',
  'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F58655718%2F157741597574%2F1%2Foriginal.jpg?w=800&auto=compress&rect=0%2C86%2C960%2C480&s=0f59d910e3401a84aaf18bd5f6c14bd3',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final _controller = new PageController();
  final _textController = new TextEditingController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final List<Widget> _pages = <Widget>[
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(colors: Colors.blue),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child:
      new FlutterLogo(style: FlutterLogoStyle.stacked, colors: Colors.red),
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new FlutterLogo(
          style: FlutterLogoStyle.horizontal, colors: Colors.green),
    ),
  ];

  TabController _tabController;

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Featured"),
    new Tab(text: "Popular"),
    new Tab(text: "Latest")
  ];

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _textController.text = '8220223398';
    return Scaffold(
      floatingActionButton:
      BeepFloatingButton(icon: Icon(Icons.home), onPressed: () {}),
      body: Container(
        color: BeepColors.cardBackground,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 24.0),
              SizedBox(height: 24.0),
              TabBar(
                isScrollable: true,
                unselectedLabelColor: BeepColors.textSecondary,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: new BeepTabIndicator(
                  indicatorHeight: 36.0,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
                tabs: tabs,
                controller: _tabController,
              ),
              SizedBox(height: 24.0),
              Container(padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: BeepActionBarText('EventbeeP')),
              SizedBox(
                  height: 24.0),
              BeepCarouselSlider(
                items: imgList,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index) {},
              ),
              SizedBox(height: 24.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BeepTextField(
                    controller: _textController,
                    labelText: 'Mobile Number',
                    onTap: () {
                      print('tapped');
                    },
                    textInputType: TextInputType.number,
                    getKeyboard: true,
                    maxLength: 10,
                  )),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BeepEventCard(
//                  height: 200.0,
//                  width: 300.0,
                  category: 'Adventure',
                  date: '24',
                  day: 'Tue',
                  month: 'Jan',
                  title: 'Event Name',
                  location: 'COEP Auditorium, Pune, India',
                  imageUrl:
                  'https://cdn2us.denofgeek.com/sites/denofgeekus/files/styles/main_wide/public/2018/04/rick_and_morty_season_4_dan_harmon.jpg',
                ),
              ),
              SizedBox(height: 24.0),
              BeepTag(text: BeepConstants.sports),
              SizedBox(height: 24.0),
//              BeepOtpView(),
              getChips(),
              SizedBox(height: 24.0),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
                child: BeepRaisedButton(
//                  onPressed: null,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          BeepDialog(
                            title: "Success",
                            description:
                            "Lorem ipsum dolor sit is a really noce way to have dummy data and I prefer this method. Thanks for opening my dialog!",
                            buttonText: "Okay",
                          ),
                    );
                  },
                  title: 'Open Dialog',
                ),
              ),
              SizedBox(height: 24.0),
//              QrImage(data: "Saurabh Mangrulkar"),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: BeepDimens.cardMarginHorizontal),
                child: BeepTicketCard(
                  title: 'Regatta',
                  qrData: 'https://meus.cogitare.space',
                  dateTime: 'Sunday, March 25 2019',
                  location: 'SASTRA University, Chithvihar block',
                  ticketType: 'VIP ticket',
                  ticketAmount: 120,
                ),
              ),
              SizedBox(height: 24.0),
              SizedBox(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    PageView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return _pages[index % _pages.length];
                      },
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: new Container(
                        color: Colors.grey[800].withOpacity(0.5),
                        padding: const EdgeInsets.all(20.0),
                        child: new Center(
                          child: BeepIndicator(
                            controller: _controller,
                            itemCount: _pages.length,
                            onPageSelected: (int page) {
                              _controller.animateToPage(
                                page,
                                duration: _kDuration,
                                curve: _kCurve,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              CircleAvatar(
                radius: BeepDimens.avatarRadius,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/378800000804897008/f521157e62d083fc4bd07d28909e34fe.jpeg"),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
                child: BeepTicketTypeCard(
                    title: 'Golden Ticket',
                    description: 'This is a gold ticket idiot12312345678901231232',
                    amount: 100),
              ),
              SizedBox(height: 24.0),
              BeepLargeHeading(text: "Large Heading"),
              SizedBox(height: 24.0),
              BeepSmallHeading(text: "Small Heading"),
              SizedBox(height: 24.0),
              BeepPrimaryText(text: "Primary text"),
              SizedBox(height: 24.0),
              BeepSecondaryText(text: "Secondary text Heading"),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget getChips() {
    return Wrap(
      spacing: 8.0,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        _interests.length,
            (int index) {
          return BeepChip(
            label: _interests[index],
            onDeleted: () {},
            onSelected: () {
              print(index);
            },
          );
        },
      ).toList(),
    );
  }
}

const List<String> _interests = <String>[
  'flake',
  'cut',
  'fragment',
  'splinter',
  'nick',
  'fry',
  'solder',
  'cash in',
  'eat',
];
