import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';

void main() => runApp(EventbeepApp());

class EventbeepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Heading'),
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
  final TextEditingController _textController = TextEditingController();

  TabController _tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Featured'),
    const Tab(text: 'Popular'),
    const Tab(text: 'Latest')
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          BeepFloatingButton(icon: const Icon(Icons.home), onPressed: () {}),
      body: Container(
        color: BeepColors.cardBackground,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BeepAppBar(
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                title: 'What are you interested in pleasee select more than 3',
                // title: 'Settings'
                // trailing: IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: () {},
                // ),
              ),
              TabBar(
                isScrollable: true,
                unselectedLabelColor: BeepColors.textSecondary,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BeepTabIndicator(
                  indicatorHeight: 36.0,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
                tabs: tabs,
                controller: _tabController,
              ),
              const SizedBox(height: 24.0),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   child: BeepLoadingComment(),
              // ),
              // const SizedBox(height: 24.0),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: BeepLoadingTimeline(),
              // ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
              //   child: BeepLoadingNews(),
              // ),
              // const SizedBox(height: 24.0),
              // const BeepBadge(
              //   sides: 8,
              //   child: Center(child: Icon(Icons.airplanemode_active)),
              //   borderRadius: 8,
              //   // size: 100,
              // ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
              //   child: BeepLoadingFeed(),
              // ),
              // const SizedBox(height: 24.0),

              const SizedBox(height: 24.0),
              // const BeepLoadingCarousal(),
              // const SizedBox(height: 24.0),
              BeepCarouselSlider(
                items: imgList,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onItemTaps: onItemTapList,
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BeepOrganiserCard(
                  image:
                      'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg',
                  name: 'Amanda Waller',
                  college: 'COEP University',
                  followAction: () {
                    print('Follow');
                  },
                  unfollowAction: () {
                    print('Unfollow');
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BeepTextField(
                    icon: Icons.phone_android,
                    controller: _textController,
                    labelText: 'Mobile Number',
                    hintText: 'Eg. 8220****98',
                    onTap: () {
                      print('tapped');
                    },
                    textInputType: TextInputType.number,
                    getKeyboard: true,
                    maxLength: 10,
                    errorText: 'Invalid mobile number',
                  )),
              const SizedBox(height: 24.0),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: const BeepLoadingEvent(),
              // ),
              // const SizedBox(height: 24.0),
              const SizedBox(height: 24.0),
              const BeepTag(text: BeepCategories.sports),
              const SizedBox(height: 24.0),
              BeepOtpField(
                // autofocus: true,
                // controller: controller,
                highlight: true,
                highlightColor: BeepColors.primary.withAlpha(40),
                defaultBorderColor: BeepColors.tertiary.withAlpha(40),
                hasTextBorderColor: BeepColors.tertiary.withAlpha(40),
                maxLength: 6,
                // hasError: snapshot.hasError,
                errorBorderColor: BeepColors.error,
                // onTextChanged: (String text) {
                //   setState(() {
                //     hasError = false;
                //   });
                // },
                // onTextChanged: _bloc.otpChanged,
                // onDone: (String text) {
                //   print('DONE $text');
                // },
                // onDone: _bloc.otpChanged,
                pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.WRAP,
                pinBoxHeight: 55,
                pinBoxWidth: 50,
                wrapAlignment: WrapAlignment.center,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: const TextStyle(fontSize: BeepDimens.textPrimary),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration:
                    const Duration(milliseconds: 100),
              ),
              getChips(),
              const SizedBox(height: 24.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
                child: BeepRaisedButton(
//                  onPressed: null,
                  onPressed: () {
                    // showDialog<BeepDialog>(
                    //   context: context,
                    //   builder: (BuildContext context) => const BeepDialog(
                    //     title: 'Success',
                    //     description:
                    //         'Lorem ipsum dolor sit is a really noce way to have dummy data and I prefer this method. Thanks for opening my dialog!',
                    //     buttonText: 'Okay',
                    //   ),
                    // );
                  },
                  title: 'Open Dialog',
                ),
              ),
              const SizedBox(height: 24.0),
//              QrImage(data: 'Saurabh Mangrulkar'),

              const SizedBox(height: 24.0),
              CircleAvatar(
                radius: BeepDimens.avatarRadius,
                backgroundImage: const CachedNetworkImageProvider(
                    'https://pbs.twimg.com/profile_images/378800000804897008/f521157e62d083fc4bd07d28909e34fe.jpeg'),
              ),
              const SizedBox(height: 24.0),
              const BeepLargeHeading(text: 'Large Heading'),
              const SizedBox(height: 24.0),
              const BeepSmallHeading(text: 'Small Heading'),
              const SizedBox(height: 24.0),
              const BeepPrimaryText(text: 'Primary text'),
              const SizedBox(height: 24.0),
              const BeepSecondaryText(text: 'Secondary text Heading'),
              const SizedBox(height: 24.0),
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
