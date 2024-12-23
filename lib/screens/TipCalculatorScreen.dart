import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  final TextEditingController _billController = TextEditingController();
  double _tipPercentage = 10.0; // Initial tip percentage
  double _tipAmount = 0.0;
  double _totalAmount = 0.0;

  // Function to calculate the tip and total
  void _calculateTip() {
    double billAmount = double.tryParse(_billController.text) ?? 0.0;

    if (billAmount > 0) {
      setState(() {
        _tipAmount = billAmount * _tipPercentage / 100;
        _totalAmount = billAmount + _tipAmount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView( // Allow scrolling for small screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Total Amount Card
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(bottom: 16.0), // Space below the total card
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Background color for the total card
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total Amount:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\₹ ${_totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Bill Amount Input
                Text(
                  'Enter the bill amount:',
                  style: TextStyle(fontSize: 18),
                ),
                TextField(
                  controller: _billController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Bill amount',
                  ),
                  onChanged: (value) => _calculateTip(),
                ),
                SizedBox(height: 20),

                // Tip Percentage Selector Buttons
                Text(
                  'Select tip percentage:',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tipPercentage = 10;
                          _calculateTip();
                        });
                      },
                      child: Text('10%'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tipPercentage = 15;
                          _calculateTip();
                        });
                      },
                      child: Text('15%'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tipPercentage = 20;
                          _calculateTip();
                        });
                      },
                      child: Text('20%'),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Tip Percentage Slider
                Text(
                  'Adjust tip percentage:',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: _tipPercentage,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: '${_tipPercentage.toStringAsFixed(0)}%',
                  onChanged: (value) {
                    setState(() {
                      _tipPercentage = value;
                      _calculateTip();
                    });
                  },
                ),
                SizedBox(height: 20),

                // Display Tip Amount
                Text(
                  'Tip Amount: \₹ ${_tipAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
