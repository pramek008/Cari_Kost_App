// ignore: unused_import
import 'package:findhouse/pages/detailPage.dart';
import 'package:findhouse/pages/homePage.dart';
import 'package:findhouse/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo404.png',
              height: 86,
              width: 300,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going?',
              style: txTitle.copyWith(fontSize: 24),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were\nrequested is already gone',
              style:
                  txSubTitle.copyWith(fontSize: 16, color: Color(0xff82868E)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 50,
              width: 210,
              decoration: BoxDecoration(
                  color: purpleColor, borderRadius: BorderRadius.circular(17)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                child: Text(
                  'Back to Home',
                  style: txTitle.copyWith(color: whiteColor),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
