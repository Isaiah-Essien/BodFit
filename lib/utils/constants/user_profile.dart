import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';

class UserProfileTest extends StatelessWidget {
  const UserProfileTest({super.key});

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Account',
          style: TextStyle(
            fontSize: 40,
          ),
        )),
        toolbarHeight: 100,
      ),
      body: SizedBox(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size(130, 130), // Customize the size as needed
                child: Image.asset(MImages.workoutOptions5, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Kanayo',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    '+2347032230756',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: onPressed, child: const Text('Edit'))
          ],
        ),
      ),
    );
  }
}
