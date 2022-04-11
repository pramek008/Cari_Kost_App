import 'package:findhouse/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String imgUrl;
  final int qtyFacility;
  final String descFacility;

  FacilityItem(
      {required this.imgUrl,
      required this.qtyFacility,
      required this.descFacility});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imgUrl,
          height: 32,
        ),
        SizedBox(
          height: 12,
        ),
        Text.rich(TextSpan(
            text: '$qtyFacility',
            style: txTitle.copyWith(fontSize: 14, color: purpleColor),
            children: [
              TextSpan(
                text: ' $descFacility',
                style: txSubTitle.copyWith(fontSize: 14, color: grayColor),
              )
            ]))
      ],
    );
  }
}
