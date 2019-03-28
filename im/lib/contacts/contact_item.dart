import 'package:flutter/material.dart';
import './contact_vo.dart';

// 好友列表项
class ContactItem extends StatelessWidget {
  // 好友数据VO
  final ContactVO item;

  // 标题名
  final String titleName;

  // 图片路径
  final String imageName;

  // 构建方法
  ContactItem({this.item, this.titleName, this.imageName});

  // 渲染好友列表项
  @override
  Widget build(BuildContext context) {
    // 列表项容器
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // 每条列表项底部添加一个边框
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 展示头像或图片
            imageName == null 
              ? Image.network(
                item.avatarUrl != '' 
                ? item.avatarUrl
                : 'https://images.unsplash.com/photo-1553524118-aa78c5c8b042?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
                width: 36.0,
                height: 36.0,
                scale: 0.9,
              )
              : Image.asset(
                imageName,
                width: 36.0,
                height: 36.0,
              ),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? item.name ?? '暂时' : titleName,
                style: TextStyle(fontSize: 18.0, color: Color(0xff353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}