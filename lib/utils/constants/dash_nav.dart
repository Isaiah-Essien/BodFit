import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashNav extends StatelessWidget implements PreferredSizeWidget {
  const DashNav({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
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
      title: const Column(
        children: [
          Text('Welcome Back!'),
          Text('Kanayo O Kanayo'),
        ],
      ),
      actions: const [
        Icon(Iconsax.search_favorite),
        Icon(Iconsax.notification),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
