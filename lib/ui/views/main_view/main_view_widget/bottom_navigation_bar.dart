import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/enums/bottom_navigation_enum.dart';
import 'package:store/ui/shared/costum_widget/costum_container.dart';
import 'package:store/ui/shared/shared_widget/app_colors.dart';
import 'package:store/ui/shared/shared_widget/utils.dart';
import 'package:store/ui/views/main_view/main_view_widget/nav_item.dart';

class CostumBottomNavigationBar extends StatelessWidget {
  final BottomNavigationEnum selected;
  final Function(BottomNavigationEnum, int) onTap;
  const CostumBottomNavigationBar(
      {super.key, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: screenWidth(41.1)),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
            svgPicture: "assets/images/svgs/products.svg",
            isSelected: selected == BottomNavigationEnum.ALLPRODUCTS,
            onTap: () {
              onTap(BottomNavigationEnum.ALLPRODUCTS, 0);
            },
          ),
          NavItem(
              svgPicture: "assets/images/svgs/home.svg",
              isSelected: selected == BottomNavigationEnum.HOME,
              onTap: () {
                onTap(BottomNavigationEnum.HOME, 1);
              }),
          Stack(
            children: [
              NavItem(
                  svgPicture: "assets/images/svgs/cart.svg",
                  isSelected: selected == BottomNavigationEnum.CART,
                  onTap: () {
                    onTap(BottomNavigationEnum.CART, 2);
                  }),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 25, start: 26),
                child: Obx(() {
                  return CostumContainer(
                    width: 30,
                    hieght: 30,
                    color: AppColors.red,
                    text:
                        "${cartService.cartCount > 9 ? "+9" : cartService.cartCount}",
                    fontsize: 20,
                  );
                }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// CostumContainer(
//                     width: 30,
//                     hieght: 30,
//                     color: AppColors.red,
//                     text: "${cartService.cartCount}",
//                     fontsize: 20,
//                   );