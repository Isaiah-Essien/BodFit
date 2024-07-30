import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine if BODFIT is in dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const MyAppBar(heading: 'Get Premium', showBackArrow: false, showCloseIcon: true, showAvatar: true),
      body: SingleChildScrollView(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Annual',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwSects / 2),
                      const Text(
                        'First 30 days free - Then ₦25000/Year',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () => _launchUrl('https://paystack.com/pay/bodfit_annual'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Subscribe Annually'),
                      ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'First 7 days free - Then ₦3000/Month',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () => _launchUrl('https://paystack.com/pay/bodfit_monthly'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Subscribe Monthly'),
                  ),
                ],
              ),
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
}
