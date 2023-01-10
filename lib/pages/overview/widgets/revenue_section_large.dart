import 'package:admin_panel_amiyan/constants/style.dart';
import 'package:admin_panel_amiyan/pages/overview/widgets/bar_chart.dart';
import 'package:admin_panel_amiyan/pages/overview/widgets/revenue_info.dart';
import 'package:admin_panel_amiyan/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
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
      child: Row(
        children: [
          Expanded(
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
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
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
