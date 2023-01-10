import 'package:admin_panel_amiyan/constants/style.dart';
import 'package:flutter/material.dart';

class RevenueInfo extends StatelessWidget {
  final String title;
  final String amount;

  const RevenueInfo({Key? key, required this.title, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: "$title \n\n",
                style: TextStyle(color: lightGrey, fontSize: 16)),
            TextSpan(
                text: "$amount тг",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF3C19C0))),
          ],
        ),
      ),
    );
  }
}
