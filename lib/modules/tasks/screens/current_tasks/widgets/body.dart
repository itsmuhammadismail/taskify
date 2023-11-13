part of '../current_tasks_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Task> tasks = [];
  List<Task> runningtasks = [];

  bool isRunningTasksLoading = true;
  bool isTodoTasksLoading = true;

  void getTasks() async {
    String id = Provider.of<UserProvider>(context, listen: false).user.id;

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
              status: task['status']))
          .toList();
      isTodoTasksLoading = false;
    });
  }

  void getRunningTasks() async {
    String id = Provider.of<UserProvider>(context, listen: false).user.id;
    try {
      var res = await NetworkHelper.request(
        url: '/tasks/started/?id=$id',
        method: 'GET',
      );

      print("get running tasks");
      print(res);
      setState(() {
        runningtasks = res
            .map<Task>((task) => Task(
                id: task['id'],
                desc: task['desc'],
                due_date: task['due_date'],
                status: task['status']))
            .toList();
        isRunningTasksLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void startTask(String taskId) async {
    String userId = Provider.of<UserProvider>(context, listen: false).user.id;
    var res = await NetworkHelper.request(
        url: '/tasks_history/',
        method: 'POST',
        data: {
          "user": userId,
          "task": taskId,
        });

    print("start tasks");
    print(res);
    getTasks();
    getRunningTasks();
  }

  void completeTask(String taskId) async {
    var res = await NetworkHelper.request(
      url: '/tasks_history/complete/$taskId',
      method: 'PUT',
    );

    print("complete tasks");
    print(res);
    getTasks();
    getRunningTasks();
  }

  @override
  void initState() {
    getTasks();
    getRunningTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Running Tasks",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            if (isRunningTasksLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              ...runningtasks
                  .map((task) =>
                      RunningTask(task: task, onComplete: completeTask))
                  .toList(),
            const SizedBox(height: 20),
            const Text(
              "Tasks To do",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            if (isTodoTasksLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              ...tasks
                  .map((task) => TodoTask(task: task, onStart: startTask))
                  .toList()
          ],
        ),
      ),
    );
  }
}
