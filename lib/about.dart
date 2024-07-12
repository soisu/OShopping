import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutUsPage();
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4C53A5),
        title: Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('image/soisu.png'), // Ensure you have this image in your assets
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'SOISU CLOTHING',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Discover your unique style with SOISU CLOTHING. We offer a curated collection of trendy and timeless pieces that blend quality and comfort. From casual wear to statement pieces, our collections are designed to inspire confidence and express individuality. Shop now and elevate your wardrobe with SOISU CLOTHING.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'Contact Us:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4C53A5)),
            ),

            ListTile(
            leading: Icon(Icons.email),
            title: Text('Email: soisuclothing@gmail.com'),
          ),

           ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone: +959428193485'),
          ),

            ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Address: No(25) 36St, Khaymarthiri Qtr, Myitkyina, Myanmar'),
          ),
        
          ],
        ),
      ),
    );
  }
}
