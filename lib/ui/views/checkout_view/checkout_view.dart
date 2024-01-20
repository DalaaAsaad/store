import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/shared/costum_widget/costum_container.dart';
import 'package:store/ui/views/main_view/main_view.dart';

import '../../shared/costum_widget/costum_text.dart';
import '../../shared/shared_widget/app_colors.dart';
import '../../shared/shared_widget/utils.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(MainView());

        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: screenWidth(20),
              end: screenWidth(20),
              top: screenWidth(20.5),
              bottom: screenWidth(20.5),
              // bottom: screenWidth(20.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: screenWidth(0.91),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Your order placed successfully',
                          styleType: TextStyleType.TITLE),
                      Row(
                        children: [
                          CustomText(
                            text: "Order No : ",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth(19),
                            textColor: AppColors.Indigo,
                          ),
                          CustomText(
                            text: "# ${(Random().nextDouble() * 256).toInt()}",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth(19),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Items Count : ",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth(19),
                            textColor: AppColors.Indigo,
                          ),
                          CustomText(
                            text: "${cartService.cartCount}",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth(19),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Divider(
                            thickness: 3,
                            color: AppColors.Indigo,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                top: screenWidth(41),
                                bottom: screenWidth(41),
                                start: screenWidth(20.55),
                                end: screenWidth(20.55)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Sub Total:",
                                      styleType: TextStyleType.CUSTOM,
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenWidth(20),
                                      textColor: AppColors.Indigo,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text:
                                              "${cartService.subTotal.toStringAsFixed(2)}",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                        SizedBox(
                                          width: screenWidth(20.55),
                                        ),
                                        CustomText(
                                          text: "SP",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: AppColors.grey,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Tax:",
                                      styleType: TextStyleType.CUSTOM,
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenWidth(20),
                                      textColor: AppColors.Indigo,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text:
                                              "${cartService.taxAmount.toStringAsFixed(2)}",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                        SizedBox(
                                          width: screenWidth(20.55),
                                        ),
                                        CustomText(
                                          text: "SP",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: AppColors.grey,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Delivery Fees:",
                                      styleType: TextStyleType.CUSTOM,
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenWidth(20),
                                      textColor: AppColors.Indigo,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text:
                                              "${cartService.deliveryFees.toStringAsFixed(2)}",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomText(
                                          text: "SP",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: AppColors.grey,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Totals:",
                                      styleType: TextStyleType.CUSTOM,
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenWidth(20),
                                      textColor: AppColors.red,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text:
                                              "${cartService.total.toStringAsFixed(2)}",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomText(
                                          text: "SP",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(20),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 3,
                            color: AppColors.Indigo,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.off(MainView()),
                  child: CostumContainer(
                    width: screenWidth(1.02),
                    hieght: screenWidth(8.22),
                    text: "Continue Shopping",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
