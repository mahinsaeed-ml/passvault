import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NumberButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}