part of '../account_screen.dart';

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
            "Account",
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
              title: const Text("Mahnoor"),
              leading: const Text("Name"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.grey.shade200,
              title: const Text("mahnoor@gmail.com"),
              leading: const Text("Email"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.grey.shade200,
              title: const Text("● ● ● ● ●"),
              leading: const Text("Password"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.grey.shade200,
              title: const Text("12 20 2000"),
              leading: const Text("Date of Birth"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.grey.shade200,
              title: const Text("Female"),
              leading: const Text("Gender"),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
