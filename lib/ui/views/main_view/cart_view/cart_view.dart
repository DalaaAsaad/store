// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store/ui/views/checkout_view/checkout_view.dart';
import 'package:store/ui/views/main_view/cart_view/cart_view_cotroller.dart';
import 'package:store/ui/views/product_details_view/product_details_view.dart';

import '../../../shared/costum_widget/costum_container.dart';
import '../../../shared/costum_widget/costum_text.dart';
import '../../../shared/shared_widget/app_colors.dart';
import '../../../shared/shared_widget/utils.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartViewController controller = Get.put(CartViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: screenWidth(20),
            end: screenWidth(20),
            top: screenWidth(20.5),
            bottom: screenWidth(19.5),
            // bottom: screenWidth(20.5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Cart', styleType: TextStyleType.TITLE),
              Obx(() {
                print(controller.count.value);
                return cartService.cartCount != 0
                    ? Container(
                        margin: EdgeInsetsDirectional.only(
                            top: screenWidth(41), bottom: screenWidth(41)),
                        height: screenWidth(1.17),
                        child: Obx(() {
                          print(controller.count.value);
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartService.cartList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ProductDetailsView(
                                      productModel: cartService
                                          .cartList[index].productModel!));
                                },
                                child: Container(
                                  height: screenWidth(2.5),
                                  padding: EdgeInsetsDirectional.only(
                                      start: screenWidth(41),
                                      end: screenWidth(41),
                                      top: screenWidth(102)),
                                  margin: EdgeInsets.all(screenWidth(58.7)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey,
                                        width: screenWidth(137)),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.remove(
                                                cartService.cartList[index]);
                                          },
                                          child: Container(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: screenWidth(1.37)),
                                              child: SvgPicture.asset(
                                                  "assets/images/svgs/delete.svg",
                                                  width: screenWidth(17),
                                                  color: AppColors.red)),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: cartService
                                                  .cartList[index]
                                                  .productModel!
                                                  .image!,
                                              width: screenWidth(8),
                                            ),
                                            SizedBox(
                                              width: screenWidth(41),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: CustomText(
                                                    text:
                                                        "${cartService.cartList[index].productModel!.title!.split('').take(4).join('')}",
                                                    styleType:
                                                        TextStyleType.CUSTOM,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: screenWidth(39),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Price:",
                                                      styleType:
                                                          TextStyleType.CUSTOM,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: screenWidth(25),
                                                      textColor:
                                                          AppColors.Indigo,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "${cartService.cartList[index].productModel!.price}",
                                                      styleType:
                                                          TextStyleType.CUSTOM,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          screenWidth(27.4),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Total:",
                                                      styleType:
                                                          TextStyleType.CUSTOM,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: screenWidth(25),
                                                      textColor:
                                                          AppColors.Indigo,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "${cartService.cartList[index].total?.toStringAsFixed(2)}",
                                                      styleType:
                                                          TextStyleType.CUSTOM,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          screenWidth(27.4),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.decreaseQty(
                                                    cartService
                                                        .cartList[index]);
                                              },
                                              child: CostumContainer(
                                                width: screenWidth(15),
                                                hieght: screenWidth(15),
                                                icon: Icons.remove,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth(82.2),
                                            ),
                                            CustomText(
                                              text:
                                                  "${cartService.cartList[index].qty}",
                                              styleType: TextStyleType.CUSTOM,
                                              fontWeight: FontWeight.w600,
                                              fontSize: screenWidth(15),
                                            ),
                                            SizedBox(
                                              width: screenWidth(82.2),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.increaseQty(
                                                    cartService
                                                        .cartList[index]);
                                              },
                                              child: CostumContainer(
                                                width: screenWidth(13.7),
                                                hieght: screenWidth(13.7),
                                                icon: Icons.add,
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              );
                            },
                          );
                        }),
                      )
                    : Container();
              }),
              Obx(() {
                print(controller.count.value);
                return Column(
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
                                    text:
                                        "${cartService.subTotal.toStringAsFixed(2)}",
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
                                    text:
                                        "${cartService.deliveryFees.toStringAsFixed(2)}",
                                    styleType: TextStyleType.CUSTOM,
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth(20),
                                  ),
                                  SizedBox(
                                    width: screenWidth(20.22),
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
                                    text:
                                        "${cartService.total.toStringAsFixed(2)}",
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
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 3,
                      color: AppColors.Indigo,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: screenWidth(8.22),
              ),
              Obx(() {
                return InkWell(
                  onTap: cartService.cartList.isNotEmpty
                      ? () => Get.off(CheckoutView())
                      : () {},
                  child: Obx(() {
                    return CostumContainer(
                        width: screenWidth(1.02),
                        hieght: screenWidth(8.22),
                        text: "Placed Order",
                        color: cartService.cartList.isNotEmpty
                            ? AppColors.Indigo
                            : AppColors.grey);
                  }),
                );
              }),
              InkWell(
                onTap: () {
                  controller.EmptyCart();
                },
                child: Obx(() {
                  return Center(
                    child: CustomText(
                      text: cartService.cartList.isNotEmpty
                          ? "Empty Cart"
                          : "Cart is Empty",
                      styleType: TextStyleType.CUSTOM,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(30),
                      textColor: AppColors.red,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
