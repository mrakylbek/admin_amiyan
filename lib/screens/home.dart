import 'package:admin_panel_amiyan/controllers/counterController.dart';
import 'package:admin_panel_amiyan/screens/other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Obx(
          //   () {
          //     return
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Clicks: ${counterController.counter.value}")),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(OtherScreen());
              },
              child: Text("Open other screen"),
            ),
          ),
        ],
      )
      //
      //     ;
      //   },
      // )
      //
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
