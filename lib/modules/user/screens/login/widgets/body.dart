part of '../login_screen.dart';

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final userProvider = Provider.of<UserProvider>(context);

    final loading = useState<bool>(false);

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    void _onSubmit() async {
      final form = _formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_emailController.text != '' && _passwordController.text != '') {
          loading.value = true;
          try {
            await Auth().signinWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );

            var res = await NetworkHelper.request(
              url: '/users?email=${_emailController.text}',
              method: 'GET',
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

            Navigate.next(context, HomeScreen.id);
          } on FirebaseAuthException catch (e) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Alert(
                  type: AlertType.failed,
                  heading: 'Login Failed!',
                  body: e.message ?? '',
                );
              },
            );
          }
          loading.value = false;

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
                    child: loading.value == true
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("Login"),
                    onPressed: () => _onSubmit(),
                  ),
                  const SizedBox(height: 20),
                  Text("or signup using"),
                  const SizedBox(height: 20),
                  InkWell(
                    child: Image.asset('assets/images/google.png'),
                    onTap: () async {
                      var data = await Auth().signInWithGoogle();
                      print("dshgd");
                      print(data.user);

                      try {
                        var res = await NetworkHelper.request(
                          url: '/users/',
                          method: 'POST',
                          data: {
                            "first_name": data.user.displayName.split(' ')[0],
                            "last_name": data.user.displayName.split(' ')[1],
                            "email": data.user.email,
                            "password": "",
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

                        Navigate.next(context, HomeScreen.id);
                      } catch (e) {}
                    },
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
