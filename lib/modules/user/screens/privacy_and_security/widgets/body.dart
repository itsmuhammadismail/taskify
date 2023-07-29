part of '../privacy_and_security_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Privacy And Security",
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
                onTap: () =>
                    Navigator.pushNamed(context, ShowPasswordScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Show Password"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, ManageAccountsScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Manage Accounts"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, ManageHistoryScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Manage History"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, UpdatesScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Updates"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, PrivacyPolicyScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Privacy"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, AppSecurityScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("App Security"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
