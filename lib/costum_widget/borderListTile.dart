import 'package:flutter/material.dart';
class BorderedListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon? icon;
  final Icon? trailIcon;


  const BorderedListTile({
    required this.title,

    required this.onTap,
    this.icon, this.trailIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: ListTile(
        leading: icon ,
        title: Text(title),
        trailing: trailIcon,
        onTap: onTap,
      ),
    );
  }
}
