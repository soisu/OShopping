import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shopping/main.dart';


// Define the Setting model
class Setting {
  final String title;
  final String route;
  final IconData icon;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
  });
}

// List of settings
final List<Setting> settings = [
  Setting(
    title: "Shipping Info",
    route: "/shipping",
    icon: CupertinoIcons.pencil_circle,
  ),
  Setting(
    title: "Payment Type",
    route: "/payment",
    icon: CupertinoIcons.creditcard,
  ),
  Setting(
    title: "My Cart",
    route: "/mycart",
    icon: CupertinoIcons.shopping_cart,
  ),
  Setting(
    title: "Logout",
    route: "/logout",
    icon: CupertinoIcons.square_arrow_right,
  ),
];

void main() {
  runApp(SettingsScreen());
}

// Define the main app widget
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define routes for the app
      routes: {
        '/': (context) => ProfileScreen(),
        //'/shipping': (context) => ShippingAddress(),
        //'/payment': (context) => PaymentMethodScreen(),
        //'/mycart': (context) => CartPage(),
        '/logout': (context) => MainPage(),
      },
      initialRoute: '/',
    );
  }
}

// Define the ProfileScreen widget
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: Color(0xFF4C53A5),
          ),
        ),
        //backgroundColor: const Color.fromARGB(255, 195, 212, 226),
       /* leading: IconButton(
          onPressed: ()  => Get.to(CartPage()),  
          icon: Icon(Icons.arrow_back,
          size: 20,
          color: Color(0xFF4C53A5),
          ),
        ),*/
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AvatarCard(),
              const SizedBox(height: 10),
              //const Divider(),
              //const SizedBox(height: 10),
            
              Text("Soi Su",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF4C53A5),
                          ),),

              Text("soisu2811@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF4C53A5),
                          ),),

              const Divider(),
              const SizedBox(height: 10),

              Column(
                children: List.generate(
                  settings.length,
                  (index) => SettingTitle(setting: settings[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the SettingTitle widget
class SettingTitle extends StatelessWidget {
  final Setting setting;

  const SettingTitle({required this.setting, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(setting.icon),
      title: Text(setting.title),
      onTap: () {
        Navigator.pushNamed(context, setting.route);
      },
    );
  }
}

// Define the AvatarCard widget
class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('image/profile.jpg'), 
      // Update with your image path
      ),
    );
  }
}



