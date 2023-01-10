import 'package:flutter/material.dart';

import 'info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Количество постоянных клиентов",
              value: "77",
              topColor: Colors.orange,
              isActive: true,
              onTap: () {},
            ),
            SizedBox(width: _width / 64),
            InfoCard(
              title: "Средняя количество покупок по клиента в месяц",
              value: "3",
              topColor: Colors.redAccent,
              isActive: true,
              onTap: () {},
            ),
          ],
        ),

        SizedBox(height: 16),

        Row(
          children: [
            InfoCard(
              title: "Средний чек",
              value: "3000",
              topColor: Colors.lightGreen,
              isActive: true,
              onTap: () {},
            ),
            SizedBox(width: _width / 64),
            InfoCard(
              title: "Средний чек пос клиента",
              value: "3500",
              topColor: Color(0xFF3C19C0),
              isActive: true,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
