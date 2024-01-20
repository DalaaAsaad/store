// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/costum_widget/costum_container.dart';
import '../../../shared/costum_widget/costum_text.dart';
import '../../../shared/shared_widget/app_colors.dart';
import '../../../shared/shared_widget/utils.dart';

class CartView1 extends StatefulWidget {
  const CartView1({super.key});

  @override
  State<CartView1> createState() => _CartView1State();
}

class _CartView1State extends State<CartView1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            start: screenWidth(20),
            end: screenWidth(20),
            top: screenWidth(20.5),
            // bottom: screenWidth(20.5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Cart', styleType: TextStyleType.TITLE),
              Container(
                margin: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                height: 350,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 160,
                      padding: EdgeInsetsDirectional.only(
                          start: 10, end: 10, top: 4),
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.grey, width: 3),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsetsDirectional.only(start: 300),
                                child: SvgPicture.asset(
                                    "assets/images/svgs/delete.svg",
                                    width: 30,
                                    color: AppColors.red)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/svgs/delete.svg",
                                    width: 70,
                                    color: AppColors.black),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "details...",
                                      styleType: TextStyleType.CUSTOM,
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenWidth(25),
                                      textColor: AppColors.black,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: "Price:",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(25),
                                          textColor: AppColors.Indigo,
                                        ),
                                        CustomText(
                                          text: "300.9",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(27.4),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: "Total:",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(25),
                                          textColor: AppColors.Indigo,
                                        ),
                                        CustomText(
                                          text: "300.9",
                                          styleType: TextStyleType.CUSTOM,
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth(27.4),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CostumContainer(
                                  width: screenWidth(15),
                                  hieght: screenWidth(15),
                                  icon: Icons.remove,
                                ),
                                SizedBox(
                                  width: screenWidth(82.2),
                                ),
                                CustomText(
                                  text: "0",
                                  styleType: TextStyleType.CUSTOM,
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth(15),
                                ),
                                SizedBox(
                                  width: screenWidth(82.2),
                                ),
                                CostumContainer(
                                  width: screenWidth(13.7),
                                  hieght: screenWidth(13.7),
                                  icon: Icons.add,
                                ),
                              ],
                            )
                          ]),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Divider(
                    thickness: 3,
                    color: AppColors.Indigo,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 10, bottom: 10, start: 20, end: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  text: "848",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  text: "848.87",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  text: "848.55",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  text: "848",
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
              ),
              SizedBox(
                height: 50,
              ),
              CostumContainer(
                width: 400,
                hieght: 50,
                text: "Placed Order",
              ),
              Center(
                child: CustomText(
                  text: "Empty Cart",
                  styleType: TextStyleType.CUSTOM,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth(30),
                  textColor: AppColors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
