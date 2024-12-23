import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  final TextEditingController _billController = TextEditingController();
  double _tipPercentage = 10.0;
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

  // Function to update the tip percentage
  void _updateTipPercentage(double percentage) {
    setState(() {
      _tipPercentage = percentage;
      _calculateTip();
    });
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
            Text(
              'Select tip percentage:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _updateTipPercentage(10),
                  child: Text('10%'),
                ),
                ElevatedButton(
                  onPressed: () => _updateTipPercentage(15),
                  child: Text('15%'),
                ),
                ElevatedButton(
                  onPressed: () => _updateTipPercentage(20),
                  child: Text('20%'),
                ),
              ],
            ),
            SizedBox(height: 20),
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