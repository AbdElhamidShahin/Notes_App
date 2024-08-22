import 'package:flutter/material.dart';

import '../../constancs/constancs.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoding = false});
  final bool isLoding;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: isLoding
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                : Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 3,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
