import 'package:flutter/material.dart';

class PinIndicator extends StatelessWidget {
  final int length;
  final int currentLength;

  const PinIndicator({
    super.key,
    required this.length,
    required this.currentLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final filled = index < currentLength;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: filled ? Colors.green : Colors.grey.shade700,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}