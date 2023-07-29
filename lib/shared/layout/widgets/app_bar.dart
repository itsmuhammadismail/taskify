import 'package:flutter/material.dart';
import 'package:taskify/modules/tasks/screens/add_task/add_task_screen.dart';
import 'package:taskify/modules/tasks/screens/stats/stats_screen.dart';
import 'package:taskify/modules/user/screens/edit_profile/edit_profile_screen.dart';
import 'package:taskify/modules/user/screens/history/history_screen.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/modules/user/screens/save_info/save_info_screen.dart';
import 'package:taskify/modules/user/screens/settings/settings_screen.dart';
import 'package:taskify/modules/user/screens/show_details/show_details_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';
import 'package:taskify/shared/widgets/alert.dart';
import 'package:taskify/shared/widgets/text.dart';

class BuildAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BuildAppBarState extends State<BuildAppBar> {
  @override
  Widget build(BuildContext context) {
    Future<void> onLogout() async {
      // context.read<UserCubit>().logout();
      // await HydratedBlocOverrides.current?.storage.clear();

      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Log Out?'),
                content: const Text('Are you sure you want to log out?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigate.next(context, SaveInfoScreen.id),
                    child: const Text('OK'),
                  ),
                ],
              ));
      // Navigate.next(context, LoginScreen.id);
    }

    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset('assets/logos/taskify-text.png'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: PopupMenuButton(
            onSelected: (value) {
              if (value == LoginScreen.id) {
                Navigate.next(context, value.toString());
              } else {
                Navigate.to(context, value.toString());
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                    Navigate.to(context, value.toString());
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: EditProfileScreen.id,
                      child: const Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.black54),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Edit Profile"),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: ShowDetailsScreen.id,
                      child: const Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.black54),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Show details"),
                          )
                        ],
                      ),
                    ),
                  ],
                  child: const Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.black54),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Profile"),
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: HistoyScreen.id,
                child: const Row(
                  children: [
                    Icon(Icons.restore, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("History"),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: StatsScreen.id,
                child: const Row(
                  children: [
                    Icon(Icons.query_stats, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Stats"),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: AddTaskScreen.id,
                child: const Row(
                  children: [
                    Icon(Icons.add_circle, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Add Task"),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: SettingsScreen.id,
                child: const Row(
                  children: [
                    Icon(Icons.settings, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Settings"),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Future.delayed(Duration.zero).then((value) {
                    onLogout();
                  });
                },
                child: const Row(
                  children: [
                    Icon(Icons.power_settings_new, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Logout"),
                    )
                  ],
                ),
              ),
            ],
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 28,
            ),
          ),
        )
      ],
    );
  }
}
