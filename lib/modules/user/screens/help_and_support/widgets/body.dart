part of '../help_and_support_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Help & Support",
            style: TextStyle(
              color: Color(0xFFDA6FCF),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Hi! How can we help you?")),
          const SizedBox(height: 20),
          Material(
            elevation: 2,
            child: ListTile(
              title: TextField(
                  decoration: InputDecoration(
                hintText: "Search for an issue",
                border: InputBorder.none,
              )),
              leading: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 200),
          Text("Contact us: Taskify.co@gmail.com"),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
