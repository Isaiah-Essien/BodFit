import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? MColors.dark : MColors.light,
            indicatorColor: darkMode
                ? MColors.light.withOpacity(0.1)
                : MColors.dark.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'Dashboard'),
              NavigationDestination(
                  icon: Icon(Iconsax.weight_15), label: 'Fitness'),
              NavigationDestination(
                  icon: Icon(Iconsax.gift), label: 'Nutrition'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    
    //Using containers and colors as placeholders for the various screens yet to be created
    // for DASHBORAD, FITNESS, WORKOUT, and PROFILE

    Container(color: Colors.black12),
    Container(color: Colors.red),
    Container(color: const Color.fromARGB(31, 19, 177, 234)),
    Container(color: const Color.fromARGB(31, 222, 35, 182)),
  ];
}
