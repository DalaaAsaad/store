import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data/models/product_model.dart';
import 'package:store/ui/shared/costum_widget/costum_container.dart';
import 'package:store/ui/views/product_details_view/product_details_view_controller.dart';
import '../../shared/costum_widget/costum_text.dart';
import '../../shared/shared_widget/Rating_bar_costum.dart';
import '../../shared/shared_widget/app_colors.dart';
import '../../shared/shared_widget/utils.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsView({super.key, required this.productModel});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

ProductDetailsViewController controller =
    Get.put(ProductDetailsViewController());

@override
class _ProductDetailsViewState extends State<ProductDetailsView> {
  void initState() {
    controller.qty.value = 1;
    super.initState();
  }

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
              bottom: screenWidth(20.5),
              // bottom: screenWidth(20.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "${widget.productModel.title}",
                    styleType: TextStyleType.BODY),
                CachedNetworkImage(
                  imageUrl: widget.productModel.image!,
                  width: screenWidth(1.6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Descroption:",
                      styleType: TextStyleType.CUSTOM,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(16.4),
                      textColor: AppColors.Indigo,
                    ),
                    RatingBarCostum(
                        saveRating: widget.productModel.rating!.rate!)
                  ],
                ),
                CustomText(
                  text: "${widget.productModel.description}",
                  styleType: TextStyleType.CUSTOM,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth(22.8),
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Category:",
                      styleType: TextStyleType.CUSTOM,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(16.4),
                      textColor: AppColors.Indigo,
                    ),
                    CustomText(
                      text: "${widget.productModel.category}",
                      styleType: TextStyleType.CUSTOM,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(27.4),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Price:",
                      styleType: TextStyleType.CUSTOM,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(16.4),
                      textColor: AppColors.Indigo,
                    ),
                    CustomText(
                      text: "${widget.productModel.price}",
                      styleType: TextStyleType.CUSTOM,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(27.4),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addToCart(widget.productModel);
                        BotToast.showText(
                            text: "Add ${controller.qty} to card List");
                      },
                      child: CostumContainer(
                        width: screenWidth(2.28),
                        hieght: screenWidth(8.22),
                        text: "Add to cart",
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.subtractFromQty();
                          },
                          child: CostumContainer(
                            width: screenWidth(13.7),
                            hieght: screenWidth(13.7),
                            icon: Icons.remove,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(82.2),
                        ),
                        Obx(() {
                          print(controller.qty);
                          return CustomText(
                            text: "${controller.qty}",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth(10.2),
                          );
                        }),
                        SizedBox(
                          width: screenWidth(82.2),
                        ),
                        InkWell(
                          onTap: () {
                            controller.addToQty();
                          },
                          child: CostumContainer(
                            width: screenWidth(13.7),
                            hieght: screenWidth(13.7),
                            icon: Icons.add,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
