import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_serializable_demo/model/data.dart';
import 'package:json_serializable_demo/model/mockdata.dart';

void main() {
  group('json parse test', (){
    test('mockdata test', (){
      Data data1 = Data.fromJson(json.decode(JsonString.mockdata));
      // expect(data1.url, '错误的数据');
      expect(data1.url, 'http://www.getdropbox.com/u/2/screencast.html');
    });
  });
}