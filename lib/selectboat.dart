import 'package:flutter/material.dart';

import 'viewboat.dart';

class CreateBoat extends StatefulWidget {
  const CreateBoat({Key? key}) : super(key: key);

  @override
  _CreateBoatState createState() => _CreateBoatState();
}

class _CreateBoatState extends State<CreateBoat> {
  final _boatNameController = TextEditingController();
  final _boatDescriptionController = TextEditingController();

  void _navigateToDetails(String boatName, int boatCapacity, double boatRate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewBoatPage(
          boatName: boatName,
          boatCapacity: boatCapacity,
          boatRate: boatRate,
        ),
      ),
    );
  }

  void _createBoat() {
    final boatName = _boatNameController.text;
    final boatDescription = _boatDescriptionController.text;
    // TODO: Implement boat creation logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Boat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => _navigateToDetails('Kayak', 2, 35.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Kayak.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Kayak'),
                        subtitle: Text('Capacity: 2, Rate per hour: RM35.00'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Yamaha WaveRunner', 2, 75.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Yamaha.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Yamaha WaveRunner'),
                        subtitle: Text('Capacity: 2, Rate per hour: RM75.00'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Barracuda 9', 10, 1250.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/barracuda_9.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Barracuda 9'),
                        subtitle:
                            Text('Capacity: 10, Rate per hour: RM1250.00'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Catamaran Lagoon', 8, 1000.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Catamaran_Lagoon.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Catamaran Lagoon'),
                        subtitle: Text('Capacity: 8, Rate per hour: RM1000.00'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Beneteau 43', 8, 1000.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/beneteau_43.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Beneteau 43'),
                        subtitle: Text('Capacity: 8, Rate per hour: RM1000.00'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Falcon 106', 12, 2000.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Falcon_106.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Falcon 106'),
                        subtitle:
                            Text('Capacity: 12, Rate per hour: RM2000.00'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
