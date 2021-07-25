import 'package:flutter/material.dart';
import 'package:foodbyte/screens/category_detail_screen.dart';
import 'package:foodbyte/values/data.dart';
import 'package:foodbyte/values/values.dart';
import 'package:foodbyte/widgets/category_card.dart';
import 'package:foodbyte/widgets/spaces.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(
            ImagePath.arrowBackIcon,
            color: AppColors.headingText,
          ),
        ),
        centerTitle: true,
        title: Text(
          StringConst.CATEGORY,
          style: Styles.customTitleTextStyle(
            color: AppColors.headingText,
            fontWeight: FontWeight.w600,
            fontSize: Sizes.TEXT_SIZE_20,
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset(
              ImagePath.searchIcon,
              color: AppColors.headingText,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Sizes.MARGIN_16, vertical: Sizes.MARGIN_16),
        child: ListView.separated(
          itemCount: categoryListImagePaths.length,
          separatorBuilder: (context, index) {
            return SpaceH12();
          },
          itemBuilder: (context, index) {
            return Container(
              child: FoodyBiteCategoryCard(
                onTap: () => Get.to(CategoryDetailScreen(
                  categoryName: category[index],
                    imagePath: categoryListImagePaths[index],
                    selectedCategory: index,
                    numberOfCategories: categoryListImagePaths.length,
                    gradient: gradients[index],
                ))
                ,
                width: MediaQuery.of(context).size.width,
                imagePath: categoryListImagePaths[index],
                gradient: gradients[index],
                category: category[index],
                hasHandle: true,
                opacity: 0.85,
                categoryTextStyle: textTheme.headline6!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: Sizes.TEXT_SIZE_22,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
