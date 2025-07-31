import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orax_assignment/Screens/postScreen.dart';

import '../controllers/navigation_controller.dart';

class bottomNavBar extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> screens = [
    PostListView(),
    Center(child: Text("search tab")),
    Center(child: Text("upload tab")),
    Center(child: Text("like tab")),
    Center(child: Text("person tab")),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: screens[navController.currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.currentIndex.value,
        onTap: navController.changeTab,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: ""),
        ],
      ),
    ));
  }
}
