part of '../signup_screen.dart';

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final credentialsProvider = Provider.of<CredentialsProvider>(context);

    final loading = useState<bool>(false);

    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    void _onSubmit() async {
      final form = _formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_firstNameController.text != '' &&
            _lastNameController.text != '' &&
            _emailController.text != '' &&
            _passwordController.text != '' &&
            _confirmPasswordController.text != '') {
          if (_passwordController.text != _confirmPasswordController.text) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Alert(
                  type: AlertType.failed,
                  heading: 'Error',
                  body: 'Password and Confirm password not matched',
                );
              },
            );
          } else {
            loading.value = true;
            try {
              await Auth().createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
                displayName:
                    _firstNameController.text + " " + _lastNameController.text,
              );

              var res = await NetworkHelper.request(
                url: '/users/',
                method: 'POST',
                data: {
                  "first_name": _firstNameController.text,
                  "last_name": _lastNameController.text,
                  "email": _emailController.text,
                  "password": _passwordController.text,
                  "dob": "2023-11-06",
                  "gender": "",
                  "university": "",
                  "mobile": "",
                  "country": ""
                },
              );

              userProvider.user = UserInterface(
                  id: res['id'],
                  first_name: res['first_name'],
                  last_name: res['last_name'],
                  email: res['email'],
                  dob: res['dob'],
                  gender: res['gender'],
                  university: res['university'],
                  mobile: res['mobile'],
                  country: res['country'],
                  password: res['password']);

              credentialsProvider.credentials = CredentialsInterface(
                email: _emailController.text,
                password: _passwordController.text,
              );

              Navigate.next(context, HomeScreen.id);
            } on FirebaseAuthException catch (e) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Alert(
                    type: AlertType.failed,
                    heading: 'Signup Failed!',
                    body: e.message ?? '',
                  );
                },
              );
            }
            loading.value = false;
          }
          form.save();
        }
      } else {}
    }

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: !themeChange.darkTheme
              ? const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFCBAACB),
                    Colors.white,
                  ],
                )
              : null,
          color: themeChange.darkTheme
              ? const Color.fromARGB(255, 49, 49, 49)
              : null,
        ),
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Sign-up",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 30),
                    AuthTextField(
                        controller: _firstNameController,
                        label: "First Name",
                        hintText: 'Type your name'),
                    const SizedBox(height: 20),
                    AuthTextField(
                        controller: _lastNameController,
                        label: "Last Name",
                        hintText: 'Type your last name'),
                    const SizedBox(height: 20),
                    AuthTextField(
                        controller: _emailController,
                        label: "Email",
                        hintText: 'Type your email'),
                    const SizedBox(height: 20),
                    AuthTextField(
                      controller: _passwordController,
                      label: "New password",
                      hintText: 'Type your new password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      controller: _confirmPasswordController,
                      label: "Confirm new password",
                      hintText: 'Re-type your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 40),
                    Button(
                        child: loading.value == true
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Submit"),
                        onPressed: () => _onSubmit()),
                    const SizedBox(height: 20),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
