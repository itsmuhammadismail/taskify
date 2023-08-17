import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';

class ViewTask extends StatelessWidget {
  const ViewTask({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Current task",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: themeChange.darkTheme ? Colors.white : Color(0xFF161616),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text("tasks of the day"),
                Icon(Icons.arrow_forward_ios)
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: const Color(0xFF69B9F2),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Chip(
                    label: Text(
                      "Youtube",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      "Progress 32%",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "YouTube tutorial",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Watch every three days",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Leave Like",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }
}
