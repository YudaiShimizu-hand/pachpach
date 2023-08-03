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
                      child: const MenuAcceleratorLabel('&Home'),
                    ),
                    if(isBtn != 'Record')
                    MenuItemButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/record');
                          },
                        child: const MenuAcceleratorLabel('&Record'),
                    ),
                    if(isBtn != 'Calendar')
                    MenuItemButton(
                          onPressed: () {
                              Navigator.pushNamed(context, '/calendar');
                          },
                        child: const MenuAcceleratorLabel('&Calendar'),
                        ),
                    if(isBtn != 'Data')
                    MenuItemButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/data');
                          },
                          child: const MenuAcceleratorLabel('&Data'),
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
                      child: const MenuAcceleratorLabel('&Logout'),
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