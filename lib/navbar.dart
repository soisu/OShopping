import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/about.dart';
import 'package:online_shopping/dress.dart';
import 'package:online_shopping/hotitems.dart';
import 'package:online_shopping/localbrand.dart';
import 'package:online_shopping/login.dart';
import 'package:online_shopping/main.dart';
import 'package:online_shopping/pants.dart';
import 'package:online_shopping/skirts.dart';
import 'package:online_shopping/tops.dart';

class NavBar extends StatelessWidget {
 final String userName;
  final String userEmail;
  
  const NavBar({Key? key, required this.userName, required this.userEmail}) : super(key: key);
  @override  
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, 
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(" Email : " + userEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('image/profile.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF4C53A5),
            ),
          ),

          ListTile(
            leading: Icon(Icons.local_fire_department_outlined),
            title: Text('Hot Items'),
             onTap: () {
              Get.to(HotItems());
            },
          ),

          ListTile(
            leading: Icon(Icons.dry_cleaning),
            title: Text('Dress'),
             onTap: () {
              Get.to(Dress());
            },
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Skirts'),
             onTap: () {
              Get.to(Skirts());
            },
          ),

          ListTile(
            leading: Icon(Icons.grid_view_outlined),
            title: Text('Local Brands'),
             onTap: () {
              Get.to(Localbrand());
            },
          ),

          ListTile(
              leading: Icon(Icons.collections),
              title: Text('Pants'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pant()),
              ),
            ),


          ListTile(
            leading: Icon(Icons.local_florist_outlined),
            title: Text('Tops'),
             onTap: () {
              Get.to(Tops());
            },
          ),

          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
             onTap: () {
              Get.to(LoginPage());
            },
          ),
       
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Get.to(About());
            },
          ),
                 
          ListTile(
           leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () {
              Get.to(MainPage());
            },
          ),
        ],
      ),
    );
  }
}
