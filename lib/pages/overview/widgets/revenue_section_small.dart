import 'package:admin_panel_amiyan/pages/overview/widgets/revenue_info.dart';
import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';
import 'bar_chart.dart';

class RevenueSectionSmall extends StatelessWidget {
  const RevenueSectionSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            color: lightGrey.withOpacity(.1),
            blurRadius: 12,
          )
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                    text: "Выручка",
                    size: 20,
                    color: lightGrey,
                    weight: FontWeight.bold),
                Container(
                  width: 600,
                  height: 200,
                  child: SimpleBarChart.withSampleData(),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: lightGrey,
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    RevenueInfo(
                      title: "За сегодня",
                      amount: "100,000",
                    ),
                    RevenueInfo(
                      title: "За неделю",
                      amount: "1,200,000",
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    RevenueInfo(
                      title: "За месяц",
                      amount: "9,000,000",
                    ),
                    RevenueInfo(
                      title: "За 12 месяцев",
                      amount: "114,000,000",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
