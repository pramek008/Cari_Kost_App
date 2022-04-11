import 'dart:convert';

import 'package:findhouse/model/spaceData.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = 'https://bwa-cozy.herokuapp.com/recommended-spaces';

class SpaceProvider extends ChangeNotifier{
  
  getRecomendedSpaces() async {
    var result = await http.get(Uri.parse(url));

    print(result.statusCode);
    // print(result.body);

    if(result.statusCode == 200){
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    }else{
      return <Space> [];
    }
  }
}