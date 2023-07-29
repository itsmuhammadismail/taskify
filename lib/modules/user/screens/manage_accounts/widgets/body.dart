part of '../manage_accounts_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool showHistory = false;

  void setShowHistory() {
    setState(() {
      showHistory = true;
    });
  }

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
              "Manage Accounts",
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
                onTap: () => Navigator.pushNamed(context, AccountScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Mahnoor"),
                leading: Image.asset('assets/images/avatar.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
