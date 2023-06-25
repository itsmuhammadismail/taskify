part of '../home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          HeroSection(),
          SizedBox(height: 20),
          ChatGPT(),
          SizedBox(height: 40),
          TaskCompletedCard(),
          SizedBox(height: 20),
          NotificationCard(),
          Spacer(),
          ViewTask(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
