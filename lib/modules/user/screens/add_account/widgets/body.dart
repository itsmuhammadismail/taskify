part of '../add_account_screen.dart';

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
                "Add Account",
                style: TextStyle(
                  color: Color(0xFFDA6FCF),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(hintText: "First Name"),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(hintText: "Last Name"),
            ),
            const SizedBox(height: 15),
            DateSelector(name: "Date of Birth", onChange: () {}),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: DropdownButton<String>(
                value: "Male",
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
            const TextField(
              decoration: InputDecoration(hintText: "School/University"),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(hintText: "Mobile No"),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(hintText: "Email"),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
