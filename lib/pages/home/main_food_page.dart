import 'package:flut_e_shop/pages/home/food_page_body.dart';
import 'package:flut_e_shop/utils/dimentions.dart';
import 'package:flut_e_shop/widgets/big_text.dart';
import 'package:flut_e_shop/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print(Dimentions.screenWidth / 45);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimentions.width20,
                right: Dimentions.width20,
              ),
              margin: EdgeInsets.only(
                top: Dimentions.height10,
                bottom: Dimentions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Bangladesh',
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Jashore",
                            color: Colors.black54,
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimentions.height45,
                    height: Dimentions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimentions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
