import 'package:flutter/material.dart';
import 'selectboat.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? _selectedBoatDetail;
  DateTime _selectedBookingDate = DateTime.now();
  DateTime _selectedDepartureDate = DateTime.now();
  TimeOfDay _selectedBookingTime = TimeOfDay.now();
  TimeOfDay _selectedDepartureTime = TimeOfDay.now();

  final List<String> _boatDetailsList = [
    'Kayak',
    'Yamaha',
    'Barracuda',
    'Catamaran',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneNoController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: _nameController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                controller: _addressController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone No',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                controller: _phoneNoController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                controller: _emailController,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Boat Details',
                ),
                value: _selectedBoatDetail,
                items: _boatDetailsList.map((boatDetail) {
                  return DropdownMenuItem(
                    value: boatDetail,
                    child: Text(boatDetail),
                  );
                }).toList(),
                onChanged: (selectedBoatDetail) {
                  setState(() {
                    _selectedBoatDetail = selectedBoatDetail as String?;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a boat detail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              //Date Time
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Booking Date'),
                subtitle: Text(
                  '${_selectedBookingDate.toLocal()}'.split(' ')[0],
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedBookingDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedBookingDate = picked;
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Booking Time'),
                subtitle: Text(
                  '${_selectedBookingTime.format(context)}',
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: _selectedBookingTime,
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedBookingTime = picked;
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Departure Date'),
                subtitle: Text(
                  '${_selectedDepartureDate.toLocal()}'.split(' ')[0],
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDepartureDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDepartureDate = picked;
                    });
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Departure Time'),
                subtitle: Text(
                  '${_selectedDepartureTime.format(context)}',
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: _selectedDepartureTime,
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDepartureTime = picked;
                    });
                  }
                },
              ),

              //F
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Registration Successful'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateBoat()),
                                  );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
