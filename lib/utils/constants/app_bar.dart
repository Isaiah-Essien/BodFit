import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;
  final String? page;

  const MyAppBar({
    Key? key,
    required this.heading,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
        size: 30,
      ), // Optional: Removes the shadow
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (page != null)
          //   IconButton(
          //     icon: const Icon(
          //       Iconsax.arrow_left,
          //       color: Colors.white,
          //       size: 28.0,
          //     ),
          //     onPressed: () => Navigator.pushNamed(context, page!),
          //   ),
          Text(
            heading,
            style: const TextStyle(
              fontSize: 23,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold, // Assuming you want black text
            ),
          ),
          // const CircleAvatar(
          //   backgroundColor: Color(0xff29A0E3),
          //   radius: 25,
          //   child: CircleAvatar(
          //     backgroundImage: AssetImage('assets/images/opt-5.jpg'),
          //     radius: 23,
          //   ),
          // ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(
            right: 10,
          ),
          child: CircleAvatar(
            backgroundColor: Color(0xff29A0E3),
            radius: 25,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/opt-5.jpg'),
              radius: 23,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
