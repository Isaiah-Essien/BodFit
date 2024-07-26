import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String imageUrl;
  final String imageName;

  const CustomImageContainer({
    super.key,
    required this.imageUrl,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = 0;
    double screenWidth = 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                width: screenWidth / 2.5,
                height: screenHeight / 5.13,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff29A0E3), width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(19.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ))),
            Text(imageName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    );
  }
}
