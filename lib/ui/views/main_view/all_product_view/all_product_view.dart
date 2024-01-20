import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store/ui/shared/shared_widget/app_colors.dart';
import 'package:store/ui/views/main_view/all_product_view/all_product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:store/ui/views/product_details_view/product_details_view.dart';
import '../../../shared/costum_widget/costum_text.dart';
import '../../../shared/shared_widget/Rating_bar_costum.dart';
import '../../../shared/shared_widget/utils.dart';

class AllProductView extends StatefulWidget {
  const AllProductView({super.key});

  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  AllProductViewController controller = Get.put(AllProductViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: screenWidth(20),
                end: screenWidth(20),
                top: screenWidth(20.5),
                // bottom: screenWidth(20.5)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: 'All Products', styleType: TextStyleType.TITLE),
                  Container(
                    height: screenWidth(8.2),
                    width: screenWidth(1.1),
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.grey)),
                    child: TextField(
                      onChanged: (value) => controller.runFilter(value),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        fillColor: AppColors.white,
                        hintText: "Search...",
                        hintStyle: TextStyle(
                            color: AppColors.grey, fontSize: screenWidth(22.8)),
                        icon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: screenWidth(41.1)),
                          child: Icon(
                            Icons.search_outlined,
                            color: AppColors.black,
                            size: screenWidth(13.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    return controller.listAllProduct.isEmpty
                        ? Center(
                            heightFactor: screenWidth(50),
                            child:
                                SpinKitWanderingCubes(color: AppColors.Indigo))
                        : controller.foundProducts.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.search_off_outlined,
                                        color: AppColors.Indigo,
                                        size: screenWidth(2)),
                                    CustomText(
                                      text: 'Product not found',
                                      styleType: TextStyleType.BODY,
                                      textColor: AppColors.Indigo,
                                      fontSize: screenWidth(30),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                height: screenWidth(0.67),
                                padding: EdgeInsetsDirectional.only(
                                    top: screenWidth(20.55),
                                    bottom: screenWidth(20.55)),
                                child: GridView.builder(
                                    itemCount: controller.foundProducts.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: screenWidth(1.4),
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return Obx(() {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(ProductDetailsView(
                                              productModel: controller
                                                  .foundProducts[index],
                                            ));
                                            controller.action.value = index;
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(
                                                screenWidth(82.2)),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      controller.action.value ==
                                                              index
                                                          ? AppColors.Indigo
                                                          : AppColors.grey,
                                                  width: screenWidth(205.5)),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: screenWidth(17.8),
                                                    width: screenWidth(3.4),
                                                    padding:
                                                        EdgeInsetsDirectional.only(
                                                            start: screenWidth(
                                                                41.1)),
                                                    margin:
                                                        EdgeInsetsDirectional.only(
                                                            start: screenWidth(
                                                                8.22)),
                                                    decoration: BoxDecoration(
                                                        color: AppColors.grey,
                                                        borderRadius: BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10))),
                                                    child: RatingBarCostum(
                                                        saveRating: controller
                                                            .foundProducts[index]
                                                            .rating!
                                                            .rate!)),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          top: screenWidth(
                                                              20.5)),
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller
                                                        .foundProducts[index]
                                                        .image!,
                                                    width: screenWidth(5.4),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          start:
                                                              screenWidth(41.1),
                                                          end:
                                                              screenWidth(41.1),
                                                          top: screenWidth(
                                                              13.7)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: CustomText(
                                                            text:
                                                                "${controller.foundProducts[index].title}",
                                                            styleType:
                                                                TextStyleType
                                                                    .CUSTOM,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                screenWidth(39),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomText(
                                                              text: "price:",
                                                              styleType:
                                                                  TextStyleType
                                                                      .CUSTOM,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  screenWidth(
                                                                      27.4),
                                                              textColor:
                                                                  AppColors
                                                                      .Indigo,
                                                            ),
                                                            CustomText(
                                                              text:
                                                                  "${controller.foundProducts[index].price}",
                                                              styleType:
                                                                  TextStyleType
                                                                      .CUSTOM,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  screenWidth(
                                                                      27.4),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    }));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
