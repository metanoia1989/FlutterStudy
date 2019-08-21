import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';

class PermissPage3 extends StatefulWidget {
  @override
  _PermissPage3State createState() => _PermissPage3State();
}

class _PermissPage3State extends State<PermissPage3> {
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
                if (Platform.isAndroid) {
                  List<Permissions> permissions = 
                    await Permission.getPermissionsStatus([PermissionName.Location]);
                  var status = permissions[0].permissionStatus;
                  print('#当前授权状态 ${status.toString()}');
                  if( status == PermissionStatus.allow || status == PermissionStatus.always
                    || status == PermissionStatus.whenInUse) {
                    print('#已获取到授权');
                  } else {
                    print('#开始申请授权');
                    List<Permissions> permissionNames = 
                      await Permission.requestPermissions([PermissionName.Location]);
                    status = permissionNames[0].permissionStatus;
                    print('#申请之后的授权状态 ${status.toString()}');
                  }
                } 

                if (Platform.isIOS) {
                  var status = await Permission.getSinglePermissionStatus(PermissionName.Location);
                  if( status == PermissionStatus.allow || status == PermissionStatus.always
                    || status == PermissionStatus.whenInUse) {
                    print('#已获取到授权');
                  } else {
                    print('#开始申请授权');
                    status = await Permission.requestSinglePermission(PermissionName.Location);
                    print('#申请之后的授权状态 ${status.toString()}');
                  }
                } 

              },
            ),
            FlatButton(
              child: Text('申请相机权限'),
              onPressed: () async {
                if (Platform.isAndroid) {
                  List<Permissions> permissions = 
                    await Permission.getPermissionsStatus([PermissionName.Camera]);
                  var status = permissions[0].permissionStatus;
                  print('#当前授权状态 ${status.toString()}');
                  if( status == PermissionStatus.allow || status == PermissionStatus.always
                    || status == PermissionStatus.whenInUse) {
                    print('#已获取到授权');
                  } else {
                    print('#开始申请授权');
                    List<Permissions> permissionNames = 
                      await Permission.requestPermissions([PermissionName.Camera]);
                    status = permissionNames[0].permissionStatus;
                    print('#申请之后的授权状态 ${status.toString()}');
                  }
                } 

                if (Platform.isIOS) {
                  var status = await Permission.getSinglePermissionStatus(PermissionName.Camera);
                  if( status == PermissionStatus.allow || status == PermissionStatus.always
                    || status == PermissionStatus.whenInUse) {
                    print('#已获取到授权');
                  } else {
                    print('#开始申请授权');
                    status = await Permission.requestSinglePermission(PermissionName.Camera);
                    print('#申请之后的授权状态 ${status.toString()}');
                  }
                } 

              },
            ),
            FlatButton(
              child: Text('打开应用设置'),
              onPressed: () {
                Permission.openSettings();
              }
            ),
          ],
        ),
      ),
    );
  }
}