import 'package:findhouse/model/tipsData.dart';
import 'package:findhouse/theme.dart';
import 'package:flutter/material.dart';

class GuideTips extends StatelessWidget {
  final Tips tips;

  GuideTips(this.tips);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            tips.imgUrl, //! url
            width: 80, height: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.name,
                style: txTitle,
              ), //! name
              SizedBox(
                height: 4,
              ),
              Text(
                tips.updateDate,
                style: txSubTitle.copyWith(color: grayColor),
              ) //! time
            ],
          ),
          Spacer(),
          Icon(
            Icons.chevron_right,
            color: Color(0xff939393),
            size: 24,
          ),
        ],
      ),
    );
  }
}
