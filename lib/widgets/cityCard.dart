import 'package:findhouse/model/cityData.dart';
import 'package:findhouse/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffECECEC),
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                city.imgUrl,
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
              city.ispopular
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(18))),
                        child: Center(
                          child: Image.asset(
                            'assets/images/iconStar.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ]),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: txTitle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
