import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/views/main_view/all_product_view/all_product_view.dart';
import 'package:store/ui/views/main_view/cart_view/cart_view.dart';
import 'package:store/ui/views/main_view/home_view/home_view.dart';
import 'package:store/ui/views/main_view/main_view_controller.dart';
import 'package:store/ui/views/main_view/main_view_widget/bottom_navigation_bar.dart';

import '../../../core/enums/bottom_navigation_enum.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  mainViewController controller = Get.put(mainViewController());
  @override
  void initState() {
    controller.selectedView.value = BottomNavigationEnum.HOME;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(() => CostumBottomNavigationBar(
            selected: controller.selectedView.value,
            onTap: (selectEnum, index) {
              controller.selectedView.value = selectEnum;
              controller.jumpToPage(selectEnum, index);
            })),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            AllProductView(),
            HomeView(),
            CartView(),
          ],
        ),
      ),
    );
  }
}
