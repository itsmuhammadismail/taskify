part of '../history_screen.dart';

class DoneTaskInterface {
  final String desc, startDate, endDate;

  DoneTaskInterface(this.desc, this.startDate, this.endDate);
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<DoneTaskInterface> tasks = [];

  void getHistory() async {
    String id = context.read<UserProvider>().user.id;
    try {
      var res = await NetworkHelper.request(
        url: '/tasks_history/?id=$id',
      );

      List<DoneTaskInterface> data = [];
      res.forEach((item) {
        if (item['end_time'] != null) {
          print(item);
          data.add(DoneTaskInterface(
              item['task_desc'], item['start_time'], item['end_time']));
        }
      });
      print(data);

      setState(() {
        tasks = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          ...tasks
              .map((task) => HistoryCard(
                    text: task.desc,
                    startTime: task.startDate,
                    endTime: task.endDate,
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.text,
    required this.startTime,
    required this.endTime,
  });

  final String text, startTime, endTime;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    DateTime start = DateTime.parse(startTime);
    DateTime end = DateTime.parse(endTime);

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
                "Start Date: ${start.day}/${kMonths[start.month - 1]}/${start.year}",
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
                "End Date: ${end.day}/${kMonths[end.month - 1]}/${end.year}",
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
