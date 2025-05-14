import 'package:flutter/material.dart';

class SumForPaymentWidget extends StatelessWidget {
  final String title;
  final int sum;

  const SumForPaymentWidget(
      {super.key, required this.title, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),),
        const Spacer(),
        Text('$sum монет', style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500
        )),
      ],
    );
  }
}
