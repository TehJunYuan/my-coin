/*
  imported packages from pub.dev
  - cool_alert, use to display the alert message
  - smooth_page_indicator,  use to creating the advertising banner
*/
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/my_card.dart';
import '../screens/top5list.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        //app title
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            const Header(),
            // content
            HomePageContent(controller: _controller),
          ],
        ),
      ),
    );
  }
}

/*
  HomePageContent widgets
  Function: Combine all elements in content section
  Last updated: 15 Apr 2023
*/
class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // advertising banner section
            AdvertisingBanner(controller: _controller),
            // account notification section
            const SendNotification(),
            // explore section
            const ExploreHeader(),
            const ExploreWidget(),
            // popular list section
            Top5List(),
          ],
        ),
      ),
    );
  }
}

/*
  Explore widget
  Function: Explore widget got four item, that's news, podcasts, bitcoins and vdieos.
  Design: User can click something to explore. Currently only the news is clickable.
          Others item like podcasts, bitcoins and video is our future planning. 
  Last updated: 10 Apr 2023
*/
class ExploreWidget extends StatelessWidget {
  const ExploreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[850],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Newspage())));
              },
            child: IconText(
              text: 'News',
              icon: Icon(
                Icons.newspaper_rounded,
                color: Colors.purple[400],
                size: 48.0,
              ),
            ),
          ),
          IconText(
            text: 'Podcasts',
            icon: Icon(
              Icons.radio_rounded,
              color: Colors.grey[350],
              size: 48.0,
            ),
          ),
          IconText(
            text: 'Bitcoins',
            icon: Icon(
              Icons.currency_bitcoin_outlined,
              color: Colors.grey[350],
              size: 48.0,
            ),
          ),
          IconText(
            text: 'Videos',
            icon: Icon(
              Icons.videocam,
              color: Colors.grey[350],
              size: 48.0,
            ),
          ),
        ],
      ),
    );
  }
}

/*
  IconText widgets
  Function: Combine Icon and Text in vertical view
  Last updated: 10 Apr 2023
*/
class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: Column(
        children: [
          icon,
          const SizedBox(
            height: 4.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
    );
  }
}

/*
  ExploreHeader widget
  Function: This widgets is used to show the header in explore section.
  Last updated: 10 Apr 2023
*/
class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: const Text(
        'Explore',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
      ),
    );
  }
}

/*
  Send notification widget
  Function: Allow system send latest notification to user. When user click it,
            it will popup the alert and change the icon and show 
            whether is turn on or turn off. By default, notification is turn off.
  Design: Since the main purpose of the app is to receive the latest news, 
          we put this feature on the home page so that users can quickly 
          choose whether to receive notifications or not.
  Last updated: 10 Apr 2023
 */
class SendNotification extends StatefulWidget {
  const SendNotification({
    super.key,
  });

  @override
  State<SendNotification> createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  // store the type of notification icon
  List<Icon> notificationIcon = [
    // _turnOnNotificaition == false
    Icon(
      Icons.notification_add_outlined,
      color: Colors.grey[350],
    ),
    // _turnOnNotificaition == true
    Icon(
      Icons.notifications_active_outlined,
      color: Colors.amber[300],
    ),
  ];

  // track icon types
  int getIcon = 0;
  bool _turnOnNotificaition = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // on clicked then change notification icons
          if (_turnOnNotificaition == false) {
            getIcon = 1;
            _turnOnNotificaition = true;
            CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: "Notification turn on successfully!",
            );
          } else {
            getIcon = 0;
            _turnOnNotificaition = false;
            CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: "Notification turn off successfully!",
            );
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: double.infinity,
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey[50],
                  ),
                ),
                Text(
                  'johndoe123@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[350],
                  ),
                ),
              ],
            ),
            notificationIcon[getIcon],
          ],
        ),
      ),
    );
  }
}

/*
  AdvertisingBanner widget
  Function: This widget is showing the picture in slide.
  Design: It can be a advertising banner for the app. Basically, this widget
          is used to show some ads.
  Last updated: 10 Apr 2023
*/
class AdvertisingBanner extends StatelessWidget {
  const AdvertisingBanner({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          height: 200,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: const [
              MyCard(
                image: 'assets/images/banner_01.png',
              ),
              MyCard(
                image: 'assets/images/banner_02.png',
              ),
              MyCard(
                image: 'assets/images/banner_03.png',
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: ExpandingDotsEffect(
            dotWidth: 13.0,
            dotHeight: 10.0,
            spacing: 7.0,
            paintStyle: PaintingStyle.fill,
            dotColor: Colors.purple.shade100,
            activeDotColor: Colors.purpleAccent,
          ),
        ),
      ],
    );
  }
}

/*
  Header widget
  Function: This widget is showing the header of the home screen.
  Design: In order to customize the appbar, we don't use the appbar widget.
          In this widget, it contains welcome quote, username and the avatar.
  Last updated: 10 Apr 2023
*/
class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: TextStyle(
                  color: Colors.grey[350],
                ),
              ),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24.0,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar_01.png'),
              radius: 22.0,
            ),
          )
        ],
      ),
    );
  }
}
