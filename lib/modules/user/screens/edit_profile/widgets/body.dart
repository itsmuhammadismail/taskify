part of '../edit_profile_screen.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _universityController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _genderController = "Male";

  @override
  void initState() {
    // TODO: implement initState
    var user = Provider.of<UserProvider>(context, listen: false).user;
    _firstNameController.text = user.first_name;
    _lastNameController.text = user.last_name;
    _universityController.text = user.university;
    _mobileController.text = user.mobile;
    _emailController.text = user.email;
    _countryController.text = user.country;
    _genderController = user.gender.capitalize();
    if (user.dob != '') {
      selectedDate = DateTime.parse(user.dob);
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    var user = context.read<UserProvider>();

    onSubmit() async {
      try {
        var res = await NetworkHelper.request(
          url: '/users/${user.user.id}',
          method: 'PUT',
          data: {
            "first_name": _firstNameController.text,
            "last_name": _lastNameController.text,
            "email": _emailController.text,
            "password": context.read<UserProvider>().user.password,
            "dob": selectedDate.toIso8601String(),
            "gender": _genderController.toLowerCase(),
            "university": _universityController.text,
            "mobile": _mobileController.text,
            "country": _countryController.text
          },
        );
        print(res);
        user.user = UserInterface(
          id: user.user.id,
          first_name: _firstNameController.text,
          last_name: _lastNameController.text,
          email: _emailController.text,
          password: context.read<UserProvider>().user.password,
          dob: selectedDate.toIso8601String(),
          gender: _genderController.toLowerCase(),
          university: _universityController.text,
          mobile: _mobileController.text,
          country: _countryController.text,
        );
      } catch (e) {
        print(e.toString());
      }
    }

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
              DateSelector(
                name: "Date of Birth",
                onChange: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                selectedDate: selectedDate,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: DropdownButton<String>(
                  value: _genderController,
                  onChanged: (String? value) {
                    setState(() {
                      _genderController = value.toString().capitalize();
                    });
                  },
                  items: ["Male", "Female", ""]
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
                controller: _universityController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(hintText: "Mobile No"),
                controller: _mobileController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(hintText: "Country"),
                controller: _countryController,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => onSubmit(),
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
