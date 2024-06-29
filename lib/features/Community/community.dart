import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAQ Page',
      theme: ThemeData.dark(),
      home: const FAQPage(),
    );
  }
}

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // onPressed code will be added here!
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/kanayo.jpg'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const FAQItem(
            question: 'Do you have premium offers?',
            answer: 'We do have a wide range of premium offers personalized just for you',
          ),
          const Divider(),
          const FAQItem(
            question: 'What can I do to check my weight?',
            answer: 'make some sacrifices'
          ),
          const Divider(),
          const FAQItem(
            question: 'I can’t access my profile',
            answer: 'Make sure that you have stable internet connection and then try again',
          ),
          const Divider(),
          const FAQItem(
            question: 'How do I Contact Customer service',
            answer: 'You can reach us by email bodfit@info.com or call +250791848842'
          ),
          const Divider(),
          const FAQItem(
            question: 'Is there a night eating plan?',
            answer: 'We have dinner on our menu which serves as the night plan as well'
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Reach out to us',
              style: TextStyle(color: Colors.white),
            ),
            leading: const Icon(Icons.message, color: Colors.white),
            onTap: () {
              // Handle on tap
            },
            tileColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          // Handle bottom navigation item tap
        },
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String? answer;

  const FAQItem({required this.question, this.answer, Key? key}) : super(key: key);

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
          ? Text(
              widget.answer!,
              style: const TextStyle(fontSize: 14),
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
