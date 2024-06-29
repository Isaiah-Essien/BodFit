import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';

// This class defines the Custom Appbar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;
  final bool showAvatar;
  final String? page;

  const MyAppBar({
    super.key,
    required this.heading,
    this.showAvatar = true, // Default value is true
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
        size: 30,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              heading,
              style: Theme.of(context).textTheme.headlineMedium!,
              textAlign: TextAlign.center,
            ),
          ),
          if (showAvatar)
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Color(0xff29A0E3),
                radius: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage(MImages.userKanayo),
                  radius: 18,
                ),
              ),
            ),
        ],
      ),
      actions: showAvatar ? [] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
