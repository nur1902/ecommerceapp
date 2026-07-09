import 'package:flutter/material.dart';
class ActionButtonWidget extends StatelessWidget {

  const ActionButtonWidget({
    super.key, required this.icons
  });
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12)
      ),
      child: icons!=null?IconButton(onPressed: (){}, icon: Icon(icons)):null,
    );
  }
}