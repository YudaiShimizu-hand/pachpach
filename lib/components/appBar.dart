import 'package:flutter/material.dart';
import 'package:pachpach/constants.dart';

class AppBarCmp extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Image.asset(
            KbaseImg,
            width: 100,
            height: 100,
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.home_filled))
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(56);
}