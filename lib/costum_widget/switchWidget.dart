import 'package:flutter/material.dart';
class SwitchWidget extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchWidget({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        Spacer(),
        Switch(
          activeColor: Colors.blue,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}