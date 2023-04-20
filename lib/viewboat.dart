import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  double _rating = 0.0;
  bool _showRatingBar = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Booking Successful'),
      actions: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showRatingBar = true;
            });
          },
          child: Text('OK'),
        ),
      ],
      content: _showRatingBar
          ? RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            )
          : null,
    );
  }
}

class _ViewBoatPageState extends State<ViewBoatPage> {
  String _discountCode = '';
  double _totalPayment = 0;
  int _rentalDuration = 0; // in hours
  bool _isPerDay = false;

  void _calculateTotalPayment() {
    double rentalRate = widget.boatRate;
    if (_discountCode.isNotEmpty) {
      rentalRate *= 0.8; // apply 20% discount
    }

    if (_isPerDay) {
      _totalPayment =
          rentalRate * _rentalDuration * 24; // calculate for per day
    } else {
      _totalPayment = rentalRate * _rentalDuration; // calculate for per hour
    }
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
      body: SingleChildScrollView(
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
            Text('Rate per hour: RM${widget.boatRate.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            Text(
              'Rental Rates',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPerDay = false;
                        _calculateTotalPayment();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: !_isPerDay
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text('Hourly Rental'),
                          SizedBox(height: 8.0),
                          Text(
                            'RM${widget.boatRate.toStringAsFixed(2)} / hour',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPerDay = true;
                        _calculateTotalPayment();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isPerDay
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text('Daily Rental'),
                          SizedBox(height: 8.0),
                          Text(
                            'RM${(widget.boatRate * 24).toStringAsFixed(2)} / day',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Rental Duration',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText:
                          _isPerDay ? 'Number of Days' : 'Number of Hours',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _rentalDuration = int.tryParse(value) ?? 0;
                        _calculateTotalPayment();
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Discount Code',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _discountCode = value;
                        _calculateTotalPayment();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Payment',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Text(
              'RM${_totalPayment.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MyDialog();
                    },
                  );
                },
                child: Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
