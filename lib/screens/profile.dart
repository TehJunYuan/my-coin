/*
  existing packages
    - material
  custom file
    - membership
    - settings
*/
import 'package:flutter/material.dart';
import 'package:mycoin/screens/membership.dart';
import '../constants/settings.dart';

class ProfilePage extends StatelessWidget {
  // get settings
  final Settings settings = Settings();

  ProfilePage({super.key});

  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              // Profile picture - show user's profile picture
              const ProfilePicture(),
              // Name and Badge - show the username and the badge that they earned
              const NameBadge(),
              // quick function - share or scan qrcode
              const QuickAction(),
              // Basic settings - edit personal information, membership preview, add/remove card and etc..
              BasicSettings(settings: settings),
            ],
          ),
        ),
      ),
    );
  }
}

/*
  QuickAction widget
  Function: Show the memberships section
  Last updated : 15 Apr 2023
*/
class QuickAction extends StatelessWidget {
  const QuickAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.purple,
            Colors.pinkAccent,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Membership())));
              },
              child: QuickActionItem(
                text: 'MyCoin+',
                icon: Icon(
                  Icons.card_membership_rounded,
                  size: 48.0,
                  color: Colors.grey[350],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
  QuickActionItem widget
  Function: combine all element in quick action
  Last updatd : 15 Apr 2023
*/
class QuickActionItem extends StatelessWidget {
  const QuickActionItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconTextVertical(
        text: text,
        icon: icon,
      ),
    );
  }
}

/*
  IconTextVertical widget
  Function: display the icon and text vertically
  Last updated : 15 Apr 2023
*/
class IconTextVertical extends StatelessWidget {
  const IconTextVertical({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            height: 8.0,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey[350]),
          )
        ],
      ),
    );
  }
}

/*
  BasicSetting widget
  Function: display the basic settings in list view
  Last updated : 15 Apr 2023
*/
class BasicSettings extends StatelessWidget {
  const BasicSettings({
    super.key,
    required this.settings,
  });

  final Settings settings;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 4.0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  settings.getBasicSettingsText(index),
                  style: TextStyle(
                    color: Colors.grey[350],
                    fontSize: 17,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey[350],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
  ProfilePicture widget
  Function: Show the profile picture
  Last updated : 15 Apr 2023
*/
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[50],
            radius: 34,
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/avatar_01.png',
              ),
              radius: 32,
            ),
          ),
        ],
      ),
    );
  }
}

class NameBadge extends StatelessWidget {
  const NameBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'John Doe',
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 8.0),
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.purple.shade500,
                    Colors.pink.shade600,
                  ],
                ),
              ),
              child: const Text(
                'Diamond',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 8.0),
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.orangeAccent.shade400,
                    Colors.amber.shade400,
                  ],
                ),
              ),
              child: const Text(
                'SVIP 8',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}