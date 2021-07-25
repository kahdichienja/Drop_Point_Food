import 'package:flutter/material.dart';
import 'package:foodbyte/routes/router.dart';
import 'package:foodbyte/screens/restaurant_details_screen.dart';
import 'package:foodbyte/values/data.dart';
import 'package:foodbyte/values/values.dart';
import 'package:foodbyte/widgets/foody_bite_card.dart';
import 'package:foodbyte/widgets/search_input_field.dart';
import 'package:foodbyte/widgets/spaces.dart';
import 'package:get/get.dart';

class TrendingRestaurantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
            'Trending Restaurant',
            style: Styles.customTitleTextStyle(
              color: AppColors.headingText,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.TEXT_SIZE_20,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(
              left: Sizes.MARGIN_16,
              right: Sizes.MARGIN_16,
              top: Sizes.MARGIN_16),
          child: Column(
            children: <Widget>[
              FoodyBiteSearchInputField(
                ImagePath.searchIcon,
                textFormFieldStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                hintText: StringConst.HINT_TEXT_TRENDING_SEARCH_BAR,
                hintTextStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                suffixIconImagePath: ImagePath.settingsIcon,
                borderWidth: 0.0,
                borderStyle: BorderStyle.solid,
              ),
              SizedBox(height: Sizes.WIDTH_16),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  separatorBuilder: (context, index) {
                    return SpaceH8();
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        child: FoodyBiteCard(
                      
                        imagePath: imagePaths[index],
                        status: status[index],
                        cardTitle: restaurantNames[index],
                        rating: ratings[index],
                        category: category[index],
                        distance: distance[index],
                        address: addresses[index],

                        onTap: () => Get.to(
                        RestaurantDetailsScreen(
                          restaurantDetails: RestaurantDetails(
                            imagePath: imagePaths[index],
                            restaurantName: restaurantNames[index],
                            restaurantAddress: addresses[index],
                            rating: ratings[index],
                            category: category[index],
                            distance: distance[index],
                          ),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
