part of '../remove_account_screen.dart';

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
            "Remove an Account",
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
              leading: Image.asset('assets/images/avatar.png'),
              trailing: Image.asset('assets/icons/delete.png'),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              child: const Text("Done"),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
