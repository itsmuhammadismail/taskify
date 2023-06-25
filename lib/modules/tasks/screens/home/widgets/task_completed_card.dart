import 'package:flutter/material.dart';

class TaskCompletedCard extends StatelessWidget {
  const TaskCompletedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFB5),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Image.asset('assets/icons/smile.png'),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We noticed that tomorrow you have a busy day, and today all the tasks have already been completed.",
                ),
                SizedBox(height: 10),
                Text(
                  "Try to redistribute the load.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
