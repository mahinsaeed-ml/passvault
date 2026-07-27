import 'package:flutter/material.dart';

import 'number_button.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onBackspace;

  const NumberPad({
    super.key,
    required this.onNumberPressed,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row(["1", "2", "3"]),
        _row(["4", "5", "6"]),
        _row(["7", "8", "9"]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 80),
            NumberButton(
              text: "0",
              onPressed: () => onNumberPressed("0"),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                iconSize: 32,
                onPressed: onBackspace,
                icon: const Icon(Icons.backspace_outlined),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _row(List<String> numbers) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers
            .map(
              (n) => NumberButton(
            text: n,
            onPressed: () => onNumberPressed(n),
          ),
        )
            .toList(),
      ),
    );
  }
}