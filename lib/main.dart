import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boat_rental_app/register_page.dart';
import 'package:boat_rental_app/selectboat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boat Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color
      appBar: AppBar(
        title: Text('Boat Rental App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/boat.png', width: 200), // Add an image
            SizedBox(height: 32),
            Text(
              'Welcome to the Boat Rental App!',
              style: GoogleFonts.roboto(
                // Use a custom font
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Register'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateBoat()),
                );
              },
              child: Text('Select Boat'),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
