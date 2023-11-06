part of '../edit_profile_screen.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String _genderController = "Male";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                decoration: InputDecoration(hintText: "First Name"),
                controller: _firstNameController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(hintText: "Last Name"),
                controller: _lastNameController,
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
              TextFormField(
                decoration: InputDecoration(hintText: "School/University"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(hintText: "Mobile No"),
              ),
              const SizedBox(height: 10),
              TextFormField(
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
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
