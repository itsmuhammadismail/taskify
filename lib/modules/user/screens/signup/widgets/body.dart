part of '../signup_screen.dart';

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          // if (_passwordController.text != _confirmPasswordController.text) {
          //   _emailController.clear();
          //   _passwordController.clear();
          //   _confirmPasswordController.clear();
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return const Alert(
          //         type: AlertType.failed,
          //         heading: 'Password change failed',
          //         body: 'Password and Confirm password not matched',
          //       );
          //     },
          //   );
          // } else {
          Navigate.next(context, HomeScreen.id);
          // }
          form.save();
        }
      } else {}
    }

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFCBAACB),
              Colors.white,
            ],
          ),
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
                        child: const Text("Submit"),
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
