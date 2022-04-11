import 'package:findhouse/model/spaceData.dart';
import 'package:findhouse/pages/detailPage.dart';
import 'package:findhouse/theme.dart';
import 'package:flutter/material.dart';

class SpaceRecom extends StatelessWidget {
  final Space space;

  SpaceRecom(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      space.spaceImgUrl,
                      width: 130,
                      height: 110, //! 1
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topRight: Radius.circular(18))),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/iconStar.png',
                            width: 18,
                            height: 18,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${space.rating}/5',
                            style: txTitle.copyWith(
                                fontSize: 13, color: whiteColor),
                          ) //! 2
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.nameKost,
                  style: txTitle,
                ), //! 3
                SizedBox(
                  height: 2,
                ),
                Text.rich(TextSpan(
                    text: '\$ ${space.price}', //! 4
                    style: txTitle.copyWith(fontSize: 16, color: purpleColor),
                    children: [
                      TextSpan(
                        text: ' / month',
                        style:
                            txSubTitle.copyWith(fontSize: 16, color: grayColor),
                      )
                    ])),
                // Row(
                //   children: [
                //     Text('\$ ${rentAmount}', style: txTitle.copyWith(fontSize: 16, color: purpleColor),),
                //     Text(' / month', style: txSubTitle.copyWith(fontSize: 16, color: grayColor),)
                //   ],
                // ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${space.city} , ${space.country}',
                  style: txSubTitle.copyWith(fontSize: 14, color: grayColor),
                ) //! 5
              ],
            ),
          ],
        ),
      ),
    );
  }
}
