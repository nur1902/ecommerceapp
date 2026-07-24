import 'package:flutter/material.dart';
class ActionButtonWidget extends StatelessWidget {

  const ActionButtonWidget({
    super.key, required this.icons, required this.callback
  });
  final IconData icons;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12)
      ),
      child: IconButton(onPressed: callback, icon: Icon(icons)),
    );
  }
}