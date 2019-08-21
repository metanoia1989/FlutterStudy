import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter_baidu_map/flutter_baidu_map.dart';

class PermissPage2 extends StatefulWidget {
  @override
  _PermissPage2State createState() => _PermissPage2State();
}

class _PermissPage2State extends State<PermissPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('授权管理 simple permission'),
      ), 
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('申请定位权限'),
              onPressed: () async {
                bool canLocation = 
                  await SimplePermissions.checkPermission(Permission.AccessCoarseLocation); 
                print('#1是否有定位权限: $canLocation');
                if(!canLocation) {
                  PermissionStatus status = 
                    await SimplePermissions.requestPermission(Permission.AccessCoarseLocation);
                  if (status != PermissionStatus.authorized) {
                    print('#2获取授权失败: ${status.toString()}');
                    SimplePermissions.openSettings();
                  }
                } else {
                  BaiduLocation location = await FlutterBaiduMap.getCurrentLocation();

                  final String address = location.province + location.city 
                    + location.district + location.street;
                  print('定位的地址是：$address');
                }
              },
            ),
            FlatButton(
              child: Text('申请相机权限'),
              onPressed: () async {
                bool canCamera = 
                  await SimplePermissions.checkPermission(Permission.Camera); 
                print('#1是否有相机权限: $canCamera');
                if(!canCamera) {
                  PermissionStatus status = 
                    await SimplePermissions.requestPermission(Permission.Camera);
                  if (status != PermissionStatus.authorized) {
                    SimplePermissions.openSettings();
                  } else {
                    print('#2获取授权失败: ${status.toString()}');
                  }
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}