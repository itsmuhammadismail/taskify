part of '../appearance_screen.dart';

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
            "Appearnce",
            style: TextStyle(
              color: Color(0xFFDA6FCF),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Material(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.grey.shade200,
              title: const Text("Dark Mode"),
              leading: Icon(Icons.dark_mode),
              trailing: Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: const Color(0xFFDA6FCF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
