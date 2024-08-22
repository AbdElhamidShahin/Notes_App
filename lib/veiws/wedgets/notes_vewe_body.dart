import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'costom_appbar.dart';
import 'notes_item.dart';
import 'notes_list_veiw.dart';

class Notes_body extends StatelessWidget {
  const Notes_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const  SizedBox(
          height: 50,
        ),
        costom_appbar(
          icon: Icons.search,
          title: ' Notes',
        ),
        Expanded(child: notes_list_weiw()),
      ],
    );
  }
}
