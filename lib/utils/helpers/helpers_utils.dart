import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MHelperFunctions {
  //Snacher functions//
  static void showSnackerBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  //Show Alert Function//
  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Okay'),
              ),
            ],
          );
        });
  }

  //Navigate to other screens//
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  //text truncate//
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  //Check for Dark mode//
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  //Screen Size//
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  //Screen Height//
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  //Screen Width//
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  //Get date format//
  static String getFormattedDate(DateTime date, {String format = 'dd MM yyy'}) {
    return DateFormat(format).format(date);
  }

  //Remove duplicates//
  static List<T> removeDuplicate<T>(List<T> list) {
    return list.toSet().toList();
  }


  //wrap widget//
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
