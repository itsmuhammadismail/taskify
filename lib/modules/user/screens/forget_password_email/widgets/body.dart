part of '../forget_password_email_screen.dart';

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final isLoading = useState<bool>(false);

    final _emailController = TextEditingController();

    void _onSubmit() async {
      final form = _formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_emailController.text != '') {
          isLoading.value = true;
          try {
            await Auth().sendPasswordResetEmail(_emailController.text);

            // Navigate.next(context, HomeScreen.id);
            Navigator.pop(context);
          } on FirebaseException catch (e) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Alert(
                  type: AlertType.failed,
                  heading: 'Reset Password Failed!',
                  body: e.message ?? '',
                );
              },
            );
          }

          isLoading.value = false;

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
                  Button(
                      child: isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Send Email"),
                      onPressed: () => _onSubmit()),
                  const SizedBox(height: 20),
                ],
              )),
        ),
      ),
    );
  }
}
