import 'package:flutter/material.dart';
import 'package:taskify/modules/user/screens/edit_profile/edit_profile_screen.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/modules/user/screens/settings/settings_screen.dart';
import 'package:taskify/modules/user/screens/show_details/show_details_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    void onLogout() async {
      // context.read<UserCubit>().logout();
      // await HydratedBlocOverrides.current?.storage.clear();
      Navigate.next(context, LoginScreen.id);
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
              print(value);
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
                value: LoginScreen.id,
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
