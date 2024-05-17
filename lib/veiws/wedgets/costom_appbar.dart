import 'package:flutter/material.dart';
import 'package:noets_app/veiws/wedgets/costom_iconsearch.dart';

class costom_appbar extends StatelessWidget {
  costom_appbar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const SizedBox(height: 50,),
           Text(
            title,
            style:const TextStyle(
              // You can set default values for your TextStyle here
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          Custom_Icon(
            icon: icon,
          ),
        ],
      ),
    );
  }
}
