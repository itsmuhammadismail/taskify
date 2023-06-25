part of '../login_screen.dart';

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    void _onSubmit() async {
      final form = _formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_emailController.text != '' && _passwordController.text != '') {
          if (_emailController.text != 'mahnoor@gmail.com' &&
              _passwordController.text != 'admin123') {
            _emailController.clear();
            _passwordController.clear();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Alert(
                  type: AlertType.failed,
                  heading: 'Login Failed!',
                  body: 'Email or password is incorrect',
                );
              },
            );
          } else {
            Navigate.next(context, HomeScreen.id);
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
                    label: "Password",
                    hintText: 'Type your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  TextFieldContainer(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () =>
                            Navigate.to(context, ForgetPasswordScreen.id),
                        child: const Text("Forget Password?",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    child: const Text("Login"),
                    onPressed: () => _onSubmit(),
                  ),
                  const SizedBox(height: 20),
                  Spacer(),
                  Column(
                    children: [
                      const Text(
                        "or sign up using",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => Navigate.to(context, SignupScreen.id),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF848080),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              )),
        ),
      ),
    );
  }
}


