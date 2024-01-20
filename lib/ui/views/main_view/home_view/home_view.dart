import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store/ui/views/product_details_view/product_details_view.dart';

import '../../../shared/costum_widget/costum_text.dart';
import '../../../shared/shared_widget/Rating_bar_costum.dart';
import '../../../shared/shared_widget/app_colors.dart';
import '../../../shared/shared_widget/utils.dart';
import 'home_view_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController controller = Get.put(HomeViewController());
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
                CustomText(text: 'Categories', styleType: TextStyleType.TITLE),
                Obx(() {
                  return controller.Categoreis.length == 1
                      ? Center(
                          child: SpinKitWanderingCubes(color: AppColors.Indigo))
                      : SizedBox(
                          width: double.infinity,
                          height: screenWidth(5.8),
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.Categoreis.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return InkWell(
                                      onTap: controller.apiFinised.value
                                          ? () {
                                              controller.current.value = index;
                                              controller.getAllProducts(
                                                  controller.Categoreis[index]);
                                              controller.apiFinised.value =
                                                  false;
                                            }
                                          : null,
                                      child: Container(
                                        margin:
                                            EdgeInsets.all(screenWidth(51.3)),
                                        width: screenWidth(2.74),
                                        height: screenWidth(6.85),
                                        decoration: BoxDecoration(
                                          color: controller.current == index
                                              ? AppColors.Indigo
                                              : AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: controller.current == index
                                                  ? AppColors.white
                                                  : AppColors.black),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text:
                                                "${controller.Categoreis[index]}",
                                            styleType: TextStyleType.BODY,
                                            fontSize: screenWidth(25),
                                            textColor:
                                                controller.current == index
                                                    ? AppColors.white
                                                    : AppColors.black,
                                          ),
                                        ),
                                      ));
                                });
                              }),
                        );
                }),
                CustomText(text: 'Products', styleType: TextStyleType.TITLE),
                Obx(() {
                  return controller.Products.isEmpty ||
                          controller.Categoreis.length == 1
                      ? Center(
                          child: SpinKitWanderingCubes(color: AppColors.Indigo))
                      : Container(
                          height: screenWidth(0.82),
                          child: GridView.builder(
                            itemCount: controller.Products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: screenWidth(1.4),
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ProductDetailsView(
                                      productModel:
                                          controller.Products[index]));
                                  controller.action.value = index;
                                },
                                child: Obx(() {
                                  return Container(
                                    margin: EdgeInsets.all(screenWidth(82.2)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: controller.action == index
                                              ? AppColors.Indigo
                                              : AppColors.grey,
                                          width: screenWidth(205.5)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: screenWidth(17.8),
                                            width: screenWidth(3.4),
                                            padding: EdgeInsetsDirectional.only(
                                                start: screenWidth(41.1)),
                                            margin: EdgeInsetsDirectional.only(
                                                start: screenWidth(8.22)),
                                            decoration: BoxDecoration(
                                                color: AppColors.grey,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            child: RatingBarCostum(
                                                saveRating: controller
                                                    .Products[index]
                                                    .rating!
                                                    .rate!)),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: screenWidth(20.5)),
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                .Products[index].image!,
                                            width: screenWidth(5.4),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: screenWidth(41.1),
                                              top: screenWidth(13.7)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: CustomText(
                                                    text:
                                                        "${controller.Products[index].title}",
                                                    styleType:
                                                        TextStyleType.CUSTOM,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: screenWidth(39),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: "price:",
                                                      styleType:
                                                          TextStyleType.CUSTOM,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          screenWidth(27.4),
                                                      textColor:
                                                          AppColors.Indigo,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "${controller.Products[index].price!.toStringAsFixed(2)}",
                                                      styleType:
                                                          TextStyleType.CUSTOM,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          screenWidth(27.4),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        );
                })
              ],
            )),
      ),
    );
  }
}
