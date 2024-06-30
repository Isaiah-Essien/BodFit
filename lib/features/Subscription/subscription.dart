import 'dart:convert'; // Import dart:convert for jsonEncode
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http; // Import http package for making HTTP requests which will be used during backend
import 'package:url_launcher/url_launcher.dart'; // This imports the url_launcher for launching URLs. I used it to launch the paypal url

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if BODFIT is in dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        title: Text('Get Premium', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Unlock the full power of our fitness and nutrition app and take your wellness journey to the next level!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // This is for the GIF which appears below the text
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/gifs/subscription.gif',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Annual subscription container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade900, // Navy blue background for annual
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Annual',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'First 30 days free - Then ₦25000/Year',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                  // Best value tag in the annual box
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Best Value',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Monthly subscription container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white), // White outline
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'First 7 days free - Then ₦3000/Month',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Button to start the 7-day free trial
            ElevatedButton(
              onPressed: () async {
                // URL for PayPal payment
                const url = 'https://paypal.me/OCTRIPP?country.x=LS&locale.x=en_US';
                if (await canLaunch(url)) {
                  await launch(url); // Launch the PayPal URL
                } else {
                  throw 'Could not launch $url'; // Error handling
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blue,
              ),
              child: const Text('Start 7-day free trial'),
            ),
            const SizedBox(height: 20),
            // Terms and conditions text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By placing this order, you agree to the ',
                style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black),
                children: [
                  const TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  const TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(
                    text: '. Subscriptions automatically renew unless cancelled at least 24-hours before the end of the current period.',
                    style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to initiate payment using Stripe (not used in this version), it will be implemented during our backend project
  Future<void> initiatePayment() async {
    try {
      // Create a payment intent on your server or use your backend endpoint
      final paymentIntentClientSecret = await createPaymentIntent();

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'BODFIT',
          customerId: 'id',
          customerEphemeralKeySecret: 'customer-ephemeral-key',
        ),
      );

      // Present the payment sheet
      await Stripe.instance.presentPaymentSheet();

      // Handle the payment result
      // You can add your custom logic here
    } catch (e) {
      print('Error: $e');
    }
  }

  // Function to create a payment intent on the server (not used in this version)
  Future<String> createPaymentIntent() async {
    // Your backend endpoint to create a payment intent
    const url = 'https://your-backend-endpoint/create-payment-intent';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'amount': 3000, // Amount in currency
        'currency': 'ngn',
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['clientSecret'];
    } else {
      throw Exception('Failed to create payment intent');
    }
  }
}
