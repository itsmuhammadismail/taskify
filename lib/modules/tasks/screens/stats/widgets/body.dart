part of '../stats_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var tasks = context.watch<RunningTaskProvider>().runningTasks;

    getBars() {
      List<Widget> bars = [];
      for (int i = 0; i < tasks.length; i++) {
        if (i % 2 == 0) {
          bars.add(Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                Container(
                  width: size.width * 70 / 100,
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Color(0xFF9A5E9A),
                  ),
                  child: Text(
                    tasks[i].task.desc,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ));
        } else {
          bars.add(Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  width: size.width * 70 / 100,
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color(0xFF69B9F6),
                  ),
                  child: Text(
                    tasks[i].task.desc,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ));
        }
      }
      return bars;
    }

    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "My Tasks",
                style: TextStyle(
                  color: Color(0xFFDA6FCF),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 300,
              child: MyLineChart(),
            ),
            SizedBox(height: 20),
            if (tasks.length == 0)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "No tasks",
                  style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF236CD9)),
                ),
              )
            else
              Column(
                children: tasks
                    .map((task) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            task.task.desc,
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF236CD9)),
                          ),
                        ))
                    .toList(),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Task Progress",
                style: TextStyle(fontSize: 16, color: Color(0xFF236CD9)),
              ),
            ),
            SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFFCBAACB),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                  children: getBars(),
                  //   [
                  //   Align(
                  //     alignment: Alignment.topRight,
                  //     child: Container(
                  //       width: size.width * 70 / 100,
                  //       padding: const EdgeInsets.all(18),
                  //       decoration: const BoxDecoration(
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(10),
                  //           bottomLeft: Radius.circular(10),
                  //         ),
                  //         color: Color(0xFF9A5E9A),
                  //       ),
                  //       child: const Text(
                  //         "",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  //   const SizedBox(height: 10),
                  //   Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Container(
                  //       width: size.width * 70 / 100,
                  //       padding: const EdgeInsets.all(18),
                  //       decoration: const BoxDecoration(
                  //         borderRadius: BorderRadius.only(
                  //           topRight: Radius.circular(10),
                  //           bottomRight: Radius.circular(10),
                  //         ),
                  //         color: Color(0xFF69B9F6),
                  //       ),
                  //       child: const Text(
                  //         "",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //   )
                  // ],
                )),
          ],
        ),
      ),
    );
  }
}
