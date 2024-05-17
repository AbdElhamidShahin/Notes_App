import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Icon extends StatelessWidget {
  const Custom_Icon({super.key, required this.icon});
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon,size: 30,),
    );
  }
}
