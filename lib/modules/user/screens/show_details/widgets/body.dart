part of '../show_details_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
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
              initialValue: "Mahnoor",
              readOnly: true,
              decoration: const InputDecoration(label: Text("First Name")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "Mansoor",
              readOnly: true,
              decoration: const InputDecoration(label: Text("Last Name")),
            ),
            const SizedBox(height: 15),
            DateSelector(name: "Date of Birth", onChange: () {}),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: DropdownButton<String>(
                value: "Female",
                onChanged: (String? value) {},
                items: ["Male", "Female"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "Sir Syed University",
              readOnly: true,
              decoration:
                  const InputDecoration(label: Text("School/University")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "0315 6578001",
              readOnly: true,
              decoration: const InputDecoration(label: Text("Mobile No")),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "mahnoor20@gmail.com",
              readOnly: true,
              decoration: const InputDecoration(label: Text("Email")),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: DropdownButton<String>(
                value: "Pakistan",
                onChanged: (String? value) {},
                items: ["Pakistan", "India"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
