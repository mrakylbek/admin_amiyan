import 'package:admin_panel_amiyan/constants/style.dart';
import 'package:admin_panel_amiyan/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCardSmall({
    Key? key,
    required this.title,
    required this.value,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: isActive ? active : lightGrey, width: 5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  text: title,
                  size: 24,
                  color: isActive ? active : lightGrey,
                  weight: FontWeight.w300,
                ),
              ),
              CustomText(
                text: value,
                size: 24,
                color: isActive ? active : lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
