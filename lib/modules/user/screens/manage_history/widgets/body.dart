part of '../manage_history_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool showHistory = false;
  List<String> historyItems = [];

  void setShowHistory() {
    getHistory();
  }

  void getHistory() async {
    String id = context.read<UserProvider>().user.id;
    try {
      var res = await NetworkHelper.request(
        url: '/tasks_history/?id=$id',
      );

      List<String> data = [];
      res.forEach((item) {
        data.add(item['task_desc']);
      });

      setState(() {
        showHistory = true;
        historyItems = data;
      });
    } catch (e) {
      print(e);
    }
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
                          ...historyItems
                              .map((item) => Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        item,
                                        style: TextStyle(
                                          color: themeChange.darkTheme
                                              ? Colors.white
                                              : Color(0xFF0821A1),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
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
