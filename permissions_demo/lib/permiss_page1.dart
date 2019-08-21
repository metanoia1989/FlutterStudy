import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissPage1 extends StatefulWidget {
  @override
  _PermissPage1State createState() => _PermissPage1State();
}

class _PermissPage1State extends State<PermissPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('授权管理 permission handler'),
      ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('申请定位权限'),
              onPressed: () async {
                ServiceStatus serviceStatus = 
                  await PermissionHandler().checkServiceStatus(PermissionGroup.location);
                print('#1 定位权限得到service status: ${serviceStatus.toString()}');

                PermissionStatus status = 
                  await PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse);

                print('#3 定位权限是否允许 ${status.toString()}');
                bool hasPermission = status == PermissionStatus.granted;

                if(!hasPermission) {
                  print('#3 开始申请权限');
                  Map<PermissionGroup, PermissionStatus> permissions = 
                    await PermissionHandler().requestPermissions([PermissionGroup.location]);
                  bool canLocation = permissions.values.toList()[0] == PermissionStatus.granted;

                  print('#4 是否有定位权限: $canLocation');
                  if (!canLocation) {
                    PermissionHandler().openAppSettings();
                  }
                }

              },
            ),
            FlatButton(
              child: Text('申请相机权限'),
              onPressed: () async {
                PermissionStatus status = 
                  await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
                print('#1 相机权限是否允许 ${status.toString()}');
                bool hasPermission = status == PermissionStatus.granted;
                if(!hasPermission) {
                  print('#2 开始申请权限');
                  Map<PermissionGroup, PermissionStatus> permissions = 
                    await PermissionHandler().requestPermissions([PermissionGroup.camera]);
                  bool canCamera = permissions.values.toList()[0] == PermissionStatus.granted;
                  print('#3 是否有定位权限: $canCamera');
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}