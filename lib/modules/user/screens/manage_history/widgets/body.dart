part of '../manage_history_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool showHistory = false;

  void setShowHistory() {
    setState(() {
      showHistory = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: size.height - 100,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Manage History",
              style: TextStyle(
                color: Color(0xFFDA6FCF),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: showHistory
                      ? [
                          SizedBox(height: 20),
                          Text(
                            "Logistic company branding",
                            style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xFF0821A1),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "YouTube Tutorial",
                            style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xFF0821A1),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Create identity",
                            style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xFF0821A1),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Briefing with South Korea ",
                            style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xFF0821A1),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Medical Landing page",
                            style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xFF0821A1),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ]
                      : [
                          const Text("Your Data is safe with us!"),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => setShowHistory(),
                            child: const Text(
                              "See your last Activity?",
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: (() => Navigate.to(context, HomeScreen.id)),
                child: const Text("Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
