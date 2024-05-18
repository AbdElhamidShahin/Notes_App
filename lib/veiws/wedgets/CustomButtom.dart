import 'package:flutter/material.dart';

import '../../constancs/constancs.dart';

class Custom_Buttom extends StatelessWidget {
  const Custom_Buttom({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: () {},
            child: Text(
              'Add',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            height: 50,
            color: KPrimaryColor,
          ),
        ),
      ),
    );
  }
}
