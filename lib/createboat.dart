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

  void _navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewBoatPage(
          boatName: _boatNameController.text,
          boatCapacity: 4,
          boatRate: 50.0,
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
                onTap: _navigateToDetails,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/yaris_car.png',
                    fit: BoxFit.cover,
                    height: 200,
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
