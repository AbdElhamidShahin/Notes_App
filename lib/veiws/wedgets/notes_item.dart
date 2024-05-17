import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EditNotesViewBody.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotesViewBody();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffFFCC80),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.all(22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter trips',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        'Build your Career with  Shain',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Spacer(),
                    Text(
                      ' May 24/3/2024 ',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                )
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
