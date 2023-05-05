/* 
  existing packages
    - material
*/
import 'package:flutter/material.dart';

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: const [
              // title and subtitle of the page
              TitleAndSubtitle(),
              // membership card design
              MembershipCard(),
              // renew button
              RenewButton(),
              // back to previous page button
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}

/*
  MembershipCard widgets
  Function: Card design
  Last updated: 15 Apr 2023
*/
class MembershipCard extends StatelessWidget {
  const MembershipCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink.shade200,
              Colors.purple.shade100,
            ],
          )),
      child: const CardContent(),
    );
  }
}

/*
  CardContent widgets
  Function: Combine all content in Card section
  Last updated: 15 Apr 2023
*/
class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AvatarAndName(),
          SizedBox(
            height: 16.0,
          ),
          Badge1(),
          SizedBox(
            height: 16.0,
          ),
          MemberId(),
        ],
      ),
    );
  }
}

/*
  MemberId widgets
  Function: return members id 
  Last updated: 15 Apr 2023
*/
class MemberId extends StatelessWidget {
  const MemberId({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '**** **** **** 0567',
          style: TextStyle(
            letterSpacing: 1.8,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}

/*
  AvatarAndName widgets
  Function: Combine avatar and name 
  Last updated: 15 Apr 2023
*/
class AvatarAndName extends StatelessWidget {
  const AvatarAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 36,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_01.png'),
            radius: 32,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'John Doe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              'Expired in 19 DEC 2023',
              style: TextStyle(
                color: Colors.grey.shade50,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/*
  Badge1 widgets
  Function: return badge
  Last updated: 15 Apr 2023
*/
class Badge1 extends StatelessWidget {
  const Badge1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(colors: [
            Colors.purple.shade500,
            Colors.pink.shade600,
          ])),
      child: Column(
        children: const [
          Text(
            'Diamond',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

/*
  TitleAndSubtitle widgets
  Function: display page title and subtitle
  Last updated: 15 Apr 2023
*/
class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MyCoin+',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey.shade100,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Join the membership and you will receive \n the latest crypto messages and \n unlock more features!',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

/*
  RenewButton widgets
  Function: return a renew button
  Last updated: 15 Apr 2023
*/
class RenewButton extends StatelessWidget {
  const RenewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(colors: [
          Colors.pink,
          Colors.purple,
        ]),
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size.fromHeight(50), // NEW
          ),
          child: const Text('Renew: RM19.90/Month ')),
    );
  }
}

/*
  BackButton widgets
  Function: return back button
  Last updated: 15 Apr 2023
*/
class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[850],
      ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size.fromHeight(50), // NEW
          ),
          child: const Text('Back')),
    );
  }
}