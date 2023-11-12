part of '../account_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().user;

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
              title: Text('${user.first_name} ${user.last_name}'),
              leading: const Text("Name"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              title: Text(user.email),
              leading: const Text("Email"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              title: const Text("● ● ● ● ●"),
              leading: const Text("Password"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              title: Text(user.dob.split('T')[0] ?? ''),
              leading: const Text("Date of Birth"),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            elevation: 2,
            child: ListTile(
              title: Text(user.gender),
              leading: const Text("Gender"),
            ),
          ),
          const SizedBox(height: 30),
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     child: Text("Add another Account"),
          //     onPressed: () => Navigate.to(context, AddAccountScreen.id),
          //   ),
          // ),
          // const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Remove Account"),
              onPressed: () => Navigate.to(context, RemoveAccountScreen.id),
            ),
          ),
        ],
      ),
    );
  }
}
