part of '../show_password_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool show = false;
  bool changPassword = false;

  void toggleShow() {
    setState(() {
      show = !show;
    });
  }

  void toggleChangePassword() {
    setState(() {
      changPassword = !changPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Show Password",
            style: TextStyle(
              color: Color(0xFFDA6FCF),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Material(
            elevation: 2,
            child: ListTile(
              title: Text(show ? "Mahnoor57" : "● ● ● ● ●"),
              leading: const Text("Password:"),
              trailing: GestureDetector(
                onTap: toggleShow,
                child: Icon(show ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: toggleChangePassword,
            child: const Text("Change Password?"),
          ),
          changPassword
              ? Column(
                  children: [
                    MyTextField(
                      hintText: "Enter new password",
                      onChange: (e) {},
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: Button(child: Text("Set"), onPressed: () {}))
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
