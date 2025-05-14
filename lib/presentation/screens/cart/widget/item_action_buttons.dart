import 'package:flutter/material.dart';

class ItemActionButtons extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final bool? hasBg;

  const ItemActionButtons(
      {super.key, required this.child, required this.onTap, this.hasBg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: hasBg != false ? Colors.black12 : null,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
