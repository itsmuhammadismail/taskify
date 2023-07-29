part of '../updates_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: size.height - 100,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Updates",
              style: TextStyle(
                color: Color(0xFFDA6FCF),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text("No recent updates"),
            Spacer(),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  child: Text("Home"),
                  onPressed: (() => Navigate.to(context, HomeScreen.id))),
            ),
          ],
        ),
      ),
    );
  }
}
