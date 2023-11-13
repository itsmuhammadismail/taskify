part of '../home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
            SizedBox(height: 40),
            ViewTask(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
