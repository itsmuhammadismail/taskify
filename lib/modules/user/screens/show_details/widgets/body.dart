part of '../show_details_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My Profile",
                style: TextStyle(
                  color: Color(0xFFDA6FCF),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.first_name ?? '',
              readOnly: true,
              decoration: const InputDecoration(label: Text("First Name")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.last_name ?? '',
              readOnly: true,
              decoration: const InputDecoration(label: Text("Last Name")),
            ),
            const SizedBox(height: 15),
            DateSelector(name: "Date of Birth", onChange: () {}),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.gender ?? '',
              readOnly: true,
              decoration: const InputDecoration(label: Text("Gender")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.university ?? '',
              readOnly: true,
              decoration:
                  const InputDecoration(label: Text("School/University")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.mobile ?? '',
              readOnly: true,
              decoration: const InputDecoration(label: Text("Mobile No")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.email ?? '',
              readOnly: true,
              decoration: const InputDecoration(label: Text("Email")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: user.country ?? '',
              readOnly: true,
              decoration: const InputDecoration(label: Text("Country")),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text("Back"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
