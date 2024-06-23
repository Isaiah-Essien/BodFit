import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;

  const MyAppBar({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        toolbarHeight: 100, // Optional: Removes the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text(
              heading,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold, // Assuming you want black text
              ),
            ),
            const CircleAvatar(
              backgroundColor: Color(0xff29A0E3),
              radius: 25,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/opt-5.jpg'),
                radius: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
