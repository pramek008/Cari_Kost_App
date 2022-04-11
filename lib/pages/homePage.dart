import 'package:findhouse/model/cityData.dart';
import 'package:findhouse/model/spaceData.dart';
import 'package:findhouse/model/tipsData.dart';
import 'package:findhouse/providers/spaceProvider.dart';
import 'package:findhouse/widgets/cityCard.dart';
import 'package:findhouse/theme.dart';
import 'package:findhouse/widgets/navBar.dart';
import 'package:findhouse/widgets/tipsCard.dart';
import 'package:findhouse/widgets/spaceCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      //! FloatActionBtn
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        // margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtomNavbarItem(
              imageUrl: 'assets/images/iconHome.png',
              isActive: true,
            ),
            ButtomNavbarItem(
              imageUrl: 'assets/images/iconMail.png',
              isActive: false,
            ),
            ButtomNavbarItem(
              imageUrl: 'assets/images/iconNews.png',
              isActive: false,
            ),
            ButtomNavbarItem(
              imageUrl: 'assets/images/iconFav.png',
              isActive: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //!------------------

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24, left: 24),
          //! Header
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: txTitle.copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Mencari Kostan yang Campur',
                    style: txSubTitle.copyWith(fontSize: 16, color: grayColor),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //! Popular Cities
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Cities',
                    style: txNameGroup,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CityCard(
                          City(
                              id: 1,
                              name: 'Jakarta',
                              imgUrl: 'assets/images/jakarta.jpg'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          City(
                              id: 2,
                              name: 'Bandung',
                              imgUrl: 'assets/images/bandung.jpg',
                              ispopular: true),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          City(
                              id: 3,
                              name: 'Surabaya',
                              imgUrl: 'assets/images/surabaya.jpg'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          City(
                              id: 4,
                              name: 'Purworejo',
                              imgUrl: 'assets/images/pwr.jpg',
                              ispopular: true),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //! Recomended Space
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  'Recommended Space',
                  style: txNameGroup,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                  padding: const EdgeInsets.all(0),
                  child: FutureBuilder(
                    future: spaceProvider.getRecomendedSpaces(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data;
                        int index = 0;
                        return Column(
                            children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceRecom(item),
                          );
                        }).toList());
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
              SizedBox(
                height: 15,
              ),

              //! Tips n Guides
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tips & Guidance',
                    style: txNameGroup,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      GuideTips(Tips(
                          id: 1,
                          imgUrl: 'assets/images/icon.png',
                          name: 'City Guidelines',
                          updateDate: 'Updated 20 Apr')),
                      GuideTips(Tips(
                          id: 2,
                          imgUrl: 'assets/images/icon2.png',
                          name: 'Jakarta Fairship',
                          updateDate: 'Updated 11 Dec')),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50 + 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
