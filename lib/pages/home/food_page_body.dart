import 'package:dots_indicator/dots_indicator.dart';
import 'package:flut_e_shop/helper/data/controllers/popular_product_controller.dart';
import 'package:flut_e_shop/model/products_model.dart';
import 'package:flut_e_shop/utils/app_constants.dart';
import 'package:flut_e_shop/utils/colors.dart';
import 'package:flut_e_shop/utils/dimentions.dart';
import 'package:flut_e_shop/widgets/big_text.dart';
import 'package:flut_e_shop/widgets/icon_and_text_widget.dart';
import 'package:flut_e_shop/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageVal = 0.0;
  final _scaleFactor = 0.8;
  final _height = Dimentions.pageViewController;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageVal = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded
              ? Container(
                  height: Dimentions.pageView,
                  // color: Colors.redAccent,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProduct.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProduct.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: _currentPageVal,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // Dot section

        // Popular sections
        SizedBox(
          height: Dimentions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimentions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimentions.width10),
              SmallText(text: "Food Pairing"),
            ],
          ),
        ),
        SizedBox(height: Dimentions.height30),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimentions.width20,
                right: Dimentions.width20,
                bottom: Dimentions.height10,
              ),
              child: Row(
                children: [
                  Container(
                    height: Dimentions.listViewImgSize,
                    width: Dimentions.listViewImgSize,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food1.png"),
                      ),
                      borderRadius: BorderRadius.circular(Dimentions.radius15),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimentions.listViewTxtContenSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimentions.radius15),
                          bottomRight: Radius.circular(Dimentions.radius15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimentions.height10,
                          right: Dimentions.height10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                                text: "Nutritians Fruits meal in Bangladesh"),
                            SizedBox(height: Dimentions.height10),
                            SmallText(text: "With Bangladeshi test"),
                            SizedBox(height: Dimentions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: "1.7km",
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: "35min",
                                  iconColor: AppColors.iconColor2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index, ProductsModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageVal.floor()) {
      var currentScale =
          1 - (_currentPageVal.floor() - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == (_currentPageVal.floor() + 1)) {
      var currentScale =
          _scaleFactor + (_currentPageVal - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == (_currentPageVal.floor() - 1)) {
      var currentScale = 1 - (_currentPageVal - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // slider section
          Container(
            height: Dimentions.pageViewController,
            margin: EdgeInsets.only(
              left: Dimentions.width10,
              right: Dimentions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentions.radius20),
              color: const Color(0xFF69c5df),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    AppConstants.BASE_URL + "/uploads/" + popularProduct.img!),
              ),
            ),
          ),
          // dot section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextController,
              margin: EdgeInsets.only(
                left: Dimentions.height30,
                right: Dimentions.height30,
                bottom: Dimentions.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius30),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.only(
                    top: Dimentions.height15,
                    left: Dimentions.width15,
                    right: Dimentions.width15,
                  ),
                  child: AppColumn(text: popularProduct.name!)),
            ),
          ),
          // Popular section
        ],
      ),
    );
  }
}
