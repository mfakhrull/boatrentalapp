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
        title: Text('Create Boat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _boatNameController,
                decoration: InputDecoration(
                  labelText: 'Boat Name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _boatDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Boat Description',
                ),
                maxLines: null,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Boat Model 1', 4, 50.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/yaris_car.png',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Boat Model 1'),
                        subtitle: Text('Capacity: 4, Rate per hour: \$50.0'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Boat Model 2', 6, 75.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/yaris_car.png',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Boat Model 2'),
                        subtitle: Text('Capacity: 6, Rate per hour: \$75.0'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _navigateToDetails('Boat Model 3', 8, 100.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/yaris_car.png',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      ListTile(
                        title: Text('Boat Model 3'),
                        subtitle: Text('Capacity: 8, Rate per hour: \$100.0'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createBoat,
                child: Text('Create Boat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
