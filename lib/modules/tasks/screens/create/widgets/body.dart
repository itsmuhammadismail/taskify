part of "../create_screen.dart";

class Task {
  String id, desc, due_date, updated_at, status;

  Task({
    required this.id,
    required this.desc,
    required this.due_date,
    required this.updated_at,
    required this.status,
  });
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime selectedDate = DateTime.now();
  String status = "Medium";
  String desc = "";
  bool isLoading = false;
  List<Task> tasks = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void getTasks(String id) async {
    var res = await NetworkHelper.request(
      url: '/tasks?id=$id',
      method: 'GET',
    );

    print("get tasks");
    print(res);
    setState(() {
      tasks = res
          .map<Task>((task) => Task(
              id: task['id'],
              desc: task['desc'],
              due_date: task['due_date'],
              updated_at: task['updated_at'],
              status: task['status']))
          .toList();
    });
  }

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var id = Provider.of<UserProvider>(context, listen: false).user.id;
      getTasks(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserInterface user = Provider.of<UserProvider>(context).user;

    void addTask() async {
      setState(() {
        isLoading = true;
      });

      try {
        var res = await NetworkHelper.request(
          url: '/tasks/',
          method: 'POST',
          data: {
            "desc": desc.toString(),
            "due_date": selectedDate.toIso8601String(),
            "status": status.toLowerCase(),
            "user": user.id.toString()
          },
        );
      } catch (e) {
        print(e.toString());
      }

      setState(() {
        isLoading = false;
      });

      getTasks(user.id.toString());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDA6FCF),
              ),
            ),
            const SizedBox(height: 20),
            MyTextField(
                hintText: "Add task descriprion",
                onChange: (e) {
                  desc = e.toString();
                }),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Due Date"),
                              Text(
                                  "${selectedDate.day} ${kMonths[selectedDate.month - 1]}"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          setState(() {
                            status = "High";
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/icons/status_high.png'),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("High"),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          setState(() {
                            status = "Medium";
                          });
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.asset(
                                'assets/icons/status_medium.png',
                                height: 23,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Medium"),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          setState(() {
                            status = "Low";
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/icons/status_low.png'),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Low"),
                            )
                          ],
                        ),
                      ),
                    ],
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/status_${status.toLowerCase()}.png',
                            width: 20,
                            height: 33,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Status"),
                              Text(status),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Button(
                onPressed: () => addTask(),
                child:
                    isLoading ? CircularProgressIndicator() : Text('Add Task'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Created Task",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDA6FCF),
              ),
            ),
            ...tasks
                .map((task) => CreatedTask(
                      desc: task.desc,
                      due_date: task.due_date,
                      status: task.status,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class CreatedTask extends StatelessWidget {
  final String desc, due_date, status;

  const CreatedTask(
      {super.key,
      required this.desc,
      required this.due_date,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Pending",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: themeChange.darkTheme
                  ? Colors.grey.shade800
                  : Color(0xFFD9D9D9),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 180),
                child: Text(
                  desc,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? Colors.grey.shade500
                      : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Text(
                    "${DateTime.parse(due_date).day} ${kMonths[DateTime.parse(due_date).month - 1]}"),
              ),
              const SizedBox(width: 10),
              Container(
                width: 30,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? Colors.grey.shade500
                      : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Image.asset(
                  'assets/icons/status_$status.png',
                  height: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
