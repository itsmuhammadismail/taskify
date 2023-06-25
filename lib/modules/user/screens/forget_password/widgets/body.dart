part of '../forget_password_screen.dart';

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    void _onSubmit() async {
      final form = _formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_emailController.text != '' &&
            _passwordController.text != '' &&
            _confirmPasswordController.text != '') {
          if (_passwordController.text != _confirmPasswordController.text) {
            _emailController.clear();
            _passwordController.clear();
            _confirmPasswordController.clear();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Alert(
                  type: AlertType.failed,
                  heading: 'Password change failed',
                  body: 'Password and Confirm password not matched',
                );
              },
            );
          } else {
            Navigate.next(context, LoginScreen.id);
          }
          form.save();
        }
      } else {}
    }

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Image.asset("assets/logos/taskify.png"),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 30),
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
                  const SizedBox(height: 20),
                  Button(
                      child: const Text("Set"), onPressed: () => _onSubmit()),
                  const SizedBox(height: 20),
                ],
              )),
        ),
      ),
    );
  }
}
