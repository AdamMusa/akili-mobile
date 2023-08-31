import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/app/modules/login/views/login_view.dart';
import 'package:resto/app/modules/setting/views/setting_view.dart';
import '../../carte/views/carte_view.dart';
import '../controllers/home_controller.dart';

import 'home_content.dart';

class HomeView extends GetView<HomeController> {
  Widget switchScreen(value) {
    switch (value) {
      case 0:
        return HomeContent();
      case 1:
        return CarteView();
      default:
        return SettingView();
    }
  }

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: const Text('Akilak'),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => LoginView()),
            padding: const EdgeInsets.only(right: 10),
            highlightColor: Colors.teal.shade700,
            splashColor: Colors.teal.shade700,
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: Obx(() => switchScreen(controller.index.value)),
      bottomNavigationBar: Obx(
        () => FloatingNavbar(
          currentIndex: controller.index.value,
          borderRadius: 24,
          iconSize: 26,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          selectedBackgroundColor: Colors.transparent,
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.teal.shade700,
          // onTap: (index) => controller.changedIndex(index),
          items: [
            FloatingNavbarItem(
              icon: Icons.home,
            ),
            FloatingNavbarItem(icon: Icons.notifications),
            FloatingNavbarItem(icon: Icons.settings),
          ],
          onTap: (index) => controller.changedIndex(index),
        ),
      ),
    );
  }
}
