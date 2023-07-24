part of '../add_task_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFDA6FCF),
                    ),
                  ),
                  Text("June 10, 2021"),
                ],
              ),
              Spacer(),
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () => Navigate.to(context, CreateScreen.id),
                  label: Text("Add Task"),
                  icon: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              )
            ],
          ),
          MyCalenderPicker(),
          MyCalender()
        ],
      ),
    );
  }
}
