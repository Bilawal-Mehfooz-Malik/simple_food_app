import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:simple_food_app/screens/delivery_progress_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  bool isFocused = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Scaffold(
      backgroundColor: style.colorScheme.background,
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.transparent,
        foregroundColor: style.colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: _cardNumber,
            expiryDate: _expiryDate,
            cardHolderName: _cardHolderName,
            cvvCode: _cvvCode,
            showBackView: isFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          // credit card form
          CreditCardForm(
            cardNumber: _cardNumber,
            expiryDate: _expiryDate,
            cardHolderName: _cardHolderName,
            cvvCode: _cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                _cardNumber = data.cardNumber;
                _cardHolderName = data.cardHolderName;
                _expiryDate = data.expiryDate;
                _cvvCode = data.cvvCode;
              });
            },
            formKey: _formKey,
          ),

          const SizedBox(height: 24),
          ElevatedButton(onPressed: _payMethod, child: const Text('Pay now')),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // user wants to pay
  void _payMethod() {
    if (_formKey.currentState!.validate()) {
      // only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $_cardNumber'),
                Text('Expiry Date: $_expiryDate'),
                Text('Card Holder Name: $_cardHolderName'),
                Text('CVV: $_cvvCode'),
              ],
            ),
          ),
          actions: [
            //cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),

            //yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryProgressScreen(),
                    ));
              },
              child: Text(
                'yes',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
