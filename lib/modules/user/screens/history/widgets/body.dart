part of '../history_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var text = [
      "Submission of assignment",
      "Attending Cloud Lecture",
      "Installing a software",
      "Quiz preparation",
      "Youtube video related to Quiz"
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "History",
            style: TextStyle(
              color: Color(0xFFDA6FCF),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Text("Done ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text("Tasks",
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ],
          ),
          const SizedBox(height: 20),
          HistoryCard(text: text[0]),
          HistoryCard(text: text[1]),
          HistoryCard(text: text[2]),
          HistoryCard(text: text[3]),
          HistoryCard(text: text[4]),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? Colors.grey.shade800
                      : Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Text(
                "Start Date: 21/May/2023",
                style: TextStyle(fontSize: 11),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? Colors.grey.shade800
                      : Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Text(
                "End Date: 22/May/2023",
                style: TextStyle(fontSize: 11),
              ),
            )
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
