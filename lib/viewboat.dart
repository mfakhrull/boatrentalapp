import 'package:flutter/material.dart';

class ViewBoatPage extends StatefulWidget {
  final String boatName;
  final int boatCapacity;
  final double boatRate;

  ViewBoatPage({
    required this.boatName,
    required this.boatCapacity,
    required this.boatRate,
  });

  @override
  _ViewBoatPageState createState() => _ViewBoatPageState();
}

class _ViewBoatPageState extends State<ViewBoatPage> {
  String _discountCode = '';
  double _totalPayment = 0;

  void _calculateTotalPayment() {
    double rentalRate = widget.boatRate;
    if (_discountCode.isNotEmpty) {
      rentalRate *= 0.8; // apply 20% discount
    }
    _totalPayment = rentalRate;
  }

  @override
  void initState() {
    super.initState();
    _calculateTotalPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.boatName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Boat Details',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Text('Model: ${widget.boatName}'),
            SizedBox(height: 8.0),
            Text('Capacity: ${widget.boatCapacity} people'),
            SizedBox(height: 8.0),
            Text('Rate per hour: \$${widget.boatRate.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            Text(
              'Rental Rates',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Hourly Rental'),
                      SizedBox(height: 8.0),
                      Text(
                        '\$${widget.boatRate.toStringAsFixed(2)} / hour',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    children: [
                      Text('Daily Rental'),
                      SizedBox(height: 8.0),
                      Text(
                        '\$${(widget.boatRate * 24).toStringAsFixed(2)} / day',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Discount Code',
              ),
              onSubmitted: (value) {
                setState(() {
                  _discountCode = value;
                  _calculateTotalPayment();
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Rental Payment',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Text(
              '\$${_totalPayment.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
