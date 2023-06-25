import 'package:flutter/material.dart';
import 'package:taskify/resources/colors.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )),
        // child: Text(child, style: const TextStyle(fontSize: 18)),
        child: child,
      ),
    );
  }
}
