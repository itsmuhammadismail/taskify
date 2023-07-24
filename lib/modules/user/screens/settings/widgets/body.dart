part of '../settings_screen.dart';

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
              "Settings",
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
                title: const Text("Account"),
                leading: Icon(Icons.perm_identity),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, HelpAndSupportScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Help & Support"),
                leading: Icon(Icons.support_agent),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, NotificationScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("Notifications"),
                leading: Icon(Icons.notifications_active),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 2,
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, AboutScreen.id),
                tileColor: Colors.grey.shade200,
                title: const Text("About"),
                leading: Icon(Icons.help),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
