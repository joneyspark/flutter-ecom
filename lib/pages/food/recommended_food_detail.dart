import 'package:flut_e_shop/utils/colors.dart';
import 'package:flut_e_shop/utils/dimentions.dart';
import 'package:flut_e_shop/widgets/app_icon.dart';
import 'package:flut_e_shop/widgets/big_text.dart';
import 'package:flut_e_shop/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            pinned: true,
            toolbarHeight: 70,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image:
                    AssetImage("assets/images/tamarind_chicken_tandoori.jpeg"),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimentions.height15),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.radius20),
                    topRight: Radius.circular(Dimentions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    text: "Sliver App Bar",
                    size: Dimentions.font26,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimentions.height15,
                    right: Dimentions.height15,
                  ),
                  child: const ExpandableTextWidget(
                    text:
                        "loremNisi irure esse non aliqua laboris amet non officia. Labore voluptate id magna qui. Laborum adipisicing irure deserunt ut dolore veniam qui ullamco exercitation. Veniam minim aliqua sint ipsum aliqua laborum culpa laboris in labore amet. Culpa veniam cupidatat sunt duis eiusmod consequat qui non ex laboris. Nisi aliquip deserunt pariatur labore culpa et ex consectetur consequat laboris. Reprehenderit mollit culpa consectetur culpa ex veniam mollit nisi Lorem. Occaecat dolore magna non cillum incididunt non sit culpa ex eu minim incididunt nostrud. Est cupidatat esse et ex laborum aute reprehenderit proident quis sit voluptate incididunt pariatur. Tempor id aute minim officia enim in eu ullamco. Quis deserunt quis est dolore velit ad voluptate id laborum est. Dolore minim qui pariatur irure eu aliqua quis cupidatat consequat eiusmod et culpa. Consectetur voluptate commodo esse consectetur id laboris ipsum. Id aliquip nostrud velit laborum aute et ex irure enim dolore.Ea ullamco consectetur sit duis officia non aliqua nulla sit sit eu incididunt. Amet ad ullamco mollit officia tempor officia anim. Qui quis irure cillum esse et esse. Incididunt consequat consectetur pariatur consequat irure est laborum tempor aliquip ullamco ut aute labore. Enim cupidatat duis laborum nisi ut Lorem pariatur irure nulla id. Lorem elit laboris nostrud culpa.Sint incididunt qui deserunt quis. Velit in nostrud do enim. Enim quis eiusmod in cupidatat do Lorem. Nulla dolore in irure aute voluptate magna commodo ullamco cupidatat. Fugiat velit cillum commodo incididunt qui sunt quis eu.Fugiat in tempor ipsum laboris duis aliquip officia quis excepteur ad commodo ex. Magna elit nulla irure veniam adipisicing deserunt fugiat exercitation proident laborum. Commodo est consectetur minim magna laboris. Laboris officia consectetur cillum sunt esse ipsum excepteur dolor qui exercitation eu. Sint duis deserunt ullamco ut laboris ea est quis nisi.Exercitation deserunt do aliquip nisi culpa proident excepteur eu laborum. Reprehenderit velit anim qui quis tempor. Laboris pariatur magna quis enim cupidatat aliqua ullamco deserunt.Aliqua reprehenderit fugiat aliqua laborum reprehenderit cillum anim cupidatat voluptate consequat. Eu exercitation in irure sit est commodo ullamco laboris cillum. Nulla est anim quis nulla in consequat occaecat eu velit sit. Ipsum officia est laboris et cupidatat in adipisicing. Nisi enim voluptate Lorem nisi exercitation consequat minim ut. Proident non amet incididunt consectetur anim. Voluptate fugiat nulla nostrud pariatur.Fugiat elit Lorem elit cupidatat do qui exercitation ad incididunt eiusmod ea adipisicing dolore velit. Amet id nulla cillum tempor pariatur in laborum veniam eu. Reprehenderit dolor qui ipsum sunt sint incididunt mollit quis magna eiusmod. Dolore pariatur enim ullamco commodo nisi commodo in occaecat ullamco dolore.Irure ut do sint labore. Ad anim officia ullamco consectetur ut occaecat sit adipisicing. Do consectetur mollit esse reprehenderit incididunt sit amet veniam quis Lorem veniam adipisicing mollit ullamco. Id ullamco nulla enim eiusmod consectetur consequat quis velit reprehenderit in. Aliqua cillum velit culpa non est commodo pariatur mollit eu officia ad anim amet pariatur.",
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimentions.width20 * 2.5,
                right: Dimentions.width20 * 2.5,
                top: Dimentions.height10,
                bottom: Dimentions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(text: "£12.88X0"),
                const AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: Dimentions.bottomHeight,
            padding: EdgeInsets.only(
              top: Dimentions.height30,
              bottom: Dimentions.height30,
              left: Dimentions.height20,
              right: Dimentions.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.radius20 * 2),
                topRight: Radius.circular(Dimentions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimentions.height20,
                    bottom: Dimentions.height20,
                    left: Dimentions.height20,
                    right: Dimentions.height20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimentions.height20,
                    bottom: Dimentions.height20,
                    left: Dimentions.height20,
                    right: Dimentions.height20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                  ),
                  child: BigText(
                    text: "£10 | Add to Cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
