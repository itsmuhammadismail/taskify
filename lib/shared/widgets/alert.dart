import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/text.dart';

enum AlertType { success, failed }

class Alert extends StatelessWidget {
  final String heading, body;
  final AlertType type;

  const Alert({
    super.key,
    required this.heading,
    required this.body,
    this.type = AlertType.success,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: type == AlertType.success
                    ? Colors.green.withOpacity(0.3)
                    : Colors.red.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                type == AlertType.success ? Icons.check : Icons.close,
                size: 60,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyText.h2(heading),
            const SizedBox(
              height: 5,
            ),
            MyText.body(body),
          ],
        ),
      ),
    );
  }
}
