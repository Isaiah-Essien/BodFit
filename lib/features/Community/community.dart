// File: lib/features/community/faq_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants/app_bar.dart';
import '../../utils/constants/colors.dart';
import '../Subscription/subscription.dart';
import 'reach_out_form.dart'; // Import the form widget

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}


class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: 'FAQ',
        showAvatar: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          FAQItem(
            question: 'Do you have premium offers?',
            answer:
            'We do have a wide range of premium offers personalized just for you.',
            onTap: () {
              // Navigate to the subscription page when tapped
              Get.to(() => const SubscriptionPage());
            },
            showSubscriptionLink: true,
          ),
          const Divider(),
          const FAQItem(
            question: 'What can I do to check my weight?',
            answer:
            'You can use our app’s weight tracking feature to monitor your progress.',
          ),
          const Divider(),
          const FAQItem(
            question: 'I can’t access my profile',
            answer:
            'Make sure that you have a stable internet connection and then try again.',
          ),
          const Divider(),
          const FAQItem(
            question: 'How do I contact customer service?',
            answer:
            'You can reach us by email at bodfit@info.com or call +250791848842.',
          ),
          const Divider(),
          const FAQItem(
            question: 'Is there a night eating plan?',
            answer:
            'We have dinner on our menu which serves as the night plan as well.',
          ),
          const Divider(),
          const FAQItem(
            question: 'How do I reset my password?',
            answer:
            'You can reset your password by going to the settings and selecting "Reset Password".',
          ),
          const Divider(),
          const FAQItem(
            question: 'What payment methods are accepted?',
            answer:
            'We accept various payment methods including credit cards, PayPal, and Stripe.',
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Reach out to us',
              style: TextStyle(color: Colors.white),
            ),
            leading: const Icon(Icons.message, color: MColors.primaryColor),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReachOutForm();
                },
              );
            },
            tileColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}

/// FAQItem is a custom widget that displays a question and its answer.
/// The answer can be expanded or collapsed by tapping on the item.
class FAQItem extends StatefulWidget {
  final String question;
  final String? answer;
  final VoidCallback? onTap;
  final bool showSubscriptionLink; // Flag to show subscription link

  const FAQItem({
    required this.question,
    this.answer,
    this.onTap,
    this.showSubscriptionLink = false,
    super.key,
  });

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.question,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: _isExpanded && widget.answer != null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.answer!,
            style: const TextStyle(
              fontSize: 14,
              color: MColors.primaryColor,
            ),
          ),
          if (widget.showSubscriptionLink &&
              widget.question == 'Do you have premium offers?')
            GestureDetector(
              onTap: widget.onTap,
              child: const Text(
                ' Tap here to check our subscription page.',
                style: TextStyle(
                  color: MColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      )
          : null,
      trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
    );
  }
}
