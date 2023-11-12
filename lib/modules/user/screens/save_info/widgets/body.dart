part of '../save_info_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool? saveInfo = null;

  @override
  Widget build(BuildContext context) {
    void setSaveInfo(bool save) async {
      setState(() {
        saveInfo = save;
      });
      try {
        await Auth().signOut();
      } catch (e) {}
      Provider.of<UserProvider>(context, listen: false).clearUser();

      Timer(const Duration(seconds: 2),
          () => Navigate.to(context, LoginScreen.id));
    }

    return SafeArea(
        child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: saveInfo == null
            ? [
                Text("Do you want to save Login details"),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("Yes"),
                      onPressed: () => setSaveInfo(true),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      child: Text("No"),
                      onPressed: () => setSaveInfo(false),
                    )
                  ],
                )
              ]
            : [
                saveInfo == true
                    ? Column(
                        children: [
                          Text(
                            "Info saved!",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                    : SizedBox(),
                Text("You are logout successfully"),
                SizedBox(height: 15),
                Image.asset('assets/icons/check.png'),
              ],
      ),
    ));
  }
}
