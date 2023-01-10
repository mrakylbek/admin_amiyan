import 'package:admin_panel_amiyan/pages/overview/widgets/info_card_small.dart';
import 'package:flutter/material.dart';

import 'info_card.dart';

class OverviewCardsSmallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Количество постоянных клиентов",
            value: "77",
            isActive: false,
            onTap: () {},
          ),
          SizedBox(width: _width / 64),
          InfoCardSmall(
            title: "Средняя количество покупок по клиента в месяц",
            value: "3",
            isActive: false,
            onTap: () {},
          ),
          SizedBox(height: _width / 64),
          InfoCardSmall(
            title: "Средний чек",
            value: "3000",
            isActive: false,
            onTap: () {},
          ),
          SizedBox(width: _width / 64),
          InfoCardSmall(
            title: "Средний чек пос клиента",
            value: "3500",
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
