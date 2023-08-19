import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pachpach/constants.dart';

class AppBarCmp extends StatelessWidget implements PreferredSizeWidget{
  AppBarCmp({required this.isBtn});
  String isBtn;
  final auth = FirebaseAuth.instance;
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
          if(isBtn != 'beforeLogin')
          MenuBar(
              children: <Widget>[
                  SubmenuButton(
                  menuChildren: <Widget>[
                    if(isBtn != 'Home')
                    MenuItemButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.home, color: Colors.white,),  // こちらがアイコンです。
                          const SizedBox(width: 8),  // これはアイコンとラベルの間のスペースです。
                          MenuAcceleratorLabel('&Home'),
                        ],
                      ),
                    ),
                    if(isBtn != 'Record')
                    MenuItemButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/record');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.edit, color: Colors.white,),  // こちらがアイコンです。
                              const SizedBox(width: 8),  // これはアイコンとラベルの間のスペースです。
                              MenuAcceleratorLabel('&Record'),
                            ],
                          ),
                    ),
                    if(isBtn != 'Calendar')
                    MenuItemButton(
                          onPressed: () {
                              Navigator.pushNamed(context, '/calendar');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month, color: Colors.white,),  // こちらがアイコンです。
                              const SizedBox(width: 8),  // これはアイコンとラベルの間のスペースです。
                              MenuAcceleratorLabel('&Calendar'),
                            ],
                          ),
                        ),
                    if(isBtn != 'Data')
                    MenuItemButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/data');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.equalizer, color: Colors.white,),  // こちらがアイコンです。
                              const SizedBox(width: 8),  // これはアイコンとラベルの間のスペースです。
                              MenuAcceleratorLabel('&Data'),
                            ],
                          ),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return AlertDialog(
                              content: Text("本当にログアウトしますか?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () async{
                                      await auth.signOut();
                                      Navigator.pushNamed(context, '/first');
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.white,),  // こちらがアイコンです。
                          const SizedBox(width: 8),  // これはアイコンとラベルの間のスペースです。
                          MenuAcceleratorLabel('&Logout'),
                        ],
                      ),
                    ),
                  ],
                    child:  const Icon(Icons.menu, color: Color(KbaseColor),
                    ),
                  ),
              ],
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(56);
}