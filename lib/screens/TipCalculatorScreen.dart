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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              divisions: 20, // Dividing the slider into 20 steps
              label: '${_tipPercentage.toStringAsFixed(0)}%',
              onChanged: (value) {
                setState(() {
                  _tipPercentage = value;
                  _calculateTip();
                });
              },
            ),
            SizedBox(height: 20),

            // Display Tip and Total Amount
            Text(
              'Tip Amount: \$${_tipAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total Amount: \$${_totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
