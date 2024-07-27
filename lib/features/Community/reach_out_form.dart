import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReachOutForm extends StatefulWidget {
  @override
  _ReachOutFormState createState() => _ReachOutFormState();
}

class _ReachOutFormState extends State<ReachOutForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _queryController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final email = _emailController.text;
      final query = _queryController.text;

      // Save to Firebase Firestore
      await FirebaseFirestore.instance.collection('queries').add({
        'name': name,
        'email': email,
        'query': query,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Show a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Your query has been submitted!')),
      );

      Navigator.of(context).pop(); // Close the form
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Reach Out to Us'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _queryController,
                decoration: InputDecoration(labelText: 'Your Query'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your query';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the form
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
