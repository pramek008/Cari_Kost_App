// ignore_for_file: unnecessary_import

import 'package:findhouse/model/spaceData.dart';
import 'package:findhouse/pages/errorPage.dart';
import 'package:findhouse/theme.dart';
import 'package:findhouse/widgets/facilityItem.dart';
import 'package:findhouse/widgets/ratingItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //!State Variabel
  bool isClicked = false;

  //*Url http
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorPage(),
            ));
      }
      // await canLaunch(url) ? await launch(url) : throw 'Could not lauch $url';
    }

    //* Dialog
    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext contex) => AlertDialog(
                title: Text(
                  'Ingin memesan Kost ?',
                  style: txTitle,
                ),
                content: Text(
                  'Apakah anda ingin menghubingi pemilik kost ?',
                  style: txSubTitle.copyWith(fontSize: 13),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cencel',
                        style:
                            txTitle.copyWith(fontSize: 16, color: purpleColor),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(contex).pop();
                        launchUrl('tel:${widget.space.phone}');
                      },
                      child: Text('Telepon',
                          style: txTitle.copyWith(
                              fontSize: 16, color: purpleColor)))
                ],
              ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            widget.space.spaceImgUrl, //* thubanail image
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: 328,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //! name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.space.nameKost,
                                style: txTitle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(TextSpan(
                                  text:
                                      '\$${widget.space.price}', //* price rent
                                  style: txTitle.copyWith(
                                      fontSize: 16, color: purpleColor),
                                  children: [
                                    TextSpan(
                                      text: ' / month',
                                      style: txSubTitle.copyWith(
                                          fontSize: 16, color: grayColor),
                                    )
                                  ])),
                            ],
                          ),
                          Row(
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                child: RatingItem(
                                    index: index, rating: widget.space.rating),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //!main facilities
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Facilities',
                            style: txNameGroup,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                imgUrl: 'assets/images/iconKitchen.png',
                                qtyFacility: widget.space.numberOfKitchens, //*
                                descFacility: 'kitchen',
                              ),
                              FacilityItem(
                                imgUrl: 'assets/images/iconDoubleBed.png',
                                qtyFacility: widget.space.numberOfBedrooms, //*
                                descFacility: 'bedroom',
                              ),
                              FacilityItem(
                                imgUrl: 'assets/images/iconLemari.png',
                                qtyFacility: widget.space.numberOfCupboards, //*
                                descFacility: 'Big Lemari',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //! photos
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photos',
                            style: txNameGroup,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 110,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.space.photos.map((item) {
                                //* link 'beberapa' foto di dalam photos oleh karena itu menggunakan map
                                return Container(
                                  margin: EdgeInsets.only(left: 18),
                                  width: 110,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(item,
                                        width: 110,
                                        height: 80,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //! Location
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: txNameGroup,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.address, //* alamat
                                    style: txNameGroup.copyWith(
                                        fontSize: 14, color: grayColor),
                                  ),
                                  Text(
                                    widget.space.city, //* kota
                                    style: txNameGroup.copyWith(
                                        fontSize: 14, color: grayColor),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  // launchUrl(
                                  //     'https://goo.gl/maps/w5qaEgdfBdLE15Z28');
                                  launchUrl(widget
                                      .space.mapUrl); //* link map google map
                                },
                                child: Image.asset(
                                  'assets/images/btnLocation.png',
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //! Book now
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.circular(17)),
                        child: TextButton(
                          onPressed: () {
                            // launchUrl('tel:+6281228477053');
                            showConfirmation(); //!
                          },
                          child: Text(
                            'Book Now',
                            style: txTitle.copyWith(color: whiteColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //! Navigation vv
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/btnBack.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  child: Image.asset(
                    isClicked
                        ? 'assets/images/btnLoveFill.png'
                        : 'assets/images/btnLove.png',
                    width: 40,
                    height: 40,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
