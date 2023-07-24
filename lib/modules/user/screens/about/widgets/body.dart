part of '../about_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "About",
            style: TextStyle(
              color: Color(0xFFDA6FCF),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            child: const Text("About TASKIFY"),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFFCBAACB),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          const SizedBox(height: 20),
          Text(
              "Hi, Taskify is developed by Taskify.co. Founded by the expert students of SirSyed University of Engineering & Technology. Under the supervision of Well Experienced Developers, this application is here to make your student life much easier.")
        ],
      ),
    );
  }
}
