import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../paths/assetpaths.dart';
class Headlines extends StatelessWidget {
  const Headlines({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;



  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children:  [
        SizedBox(child: SvgPicture.asset(Assetpaths.logo),
          height: 120,
        ),

        Text('${title}',

          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),


        ),
        Text('${subtitle}',
          style: TextStyle(color: Colors.grey),
        )

      ],
      ),);
  }
}
