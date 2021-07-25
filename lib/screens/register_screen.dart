import 'package:flutter/material.dart';
import 'package:foodbyte/screens/login_screen.dart';
import 'package:foodbyte/screens/set_location_screen.dart';
import 'package:foodbyte/values/values.dart';
import 'package:foodbyte/widgets/custom_text_form_field.dart';
import 'package:foodbyte/widgets/dark_overlay.dart';
import 'package:foodbyte/widgets/potbelly_button.dart';
import 'package:foodbyte/widgets/spaces.dart';
import 'package:get/get.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: Decorations.regularDecoration,
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                child: Image.asset(
                  ImagePath.boiledEggs,
                  height: heightOfScreen,
                  width: widthOfScreen,
                  fit: BoxFit.cover,
                ),
              ),
              DarkOverLay(),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 40,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_40),
                  child: ListView(
                    children: [
                      SpaceH36(),
                      _buildProfileSelector(),
                      SpaceH16(),
                      _buildForm(),
                      SpaceH40(),
                      PotbellyButton(
                        StringConst.REGISTER,
                        onTap: () =>  Get.to(SetLocationScreen()),
                      ),
                      SpaceH40(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConst.HAVE_AN_ACCOUNT_QUESTION,
                            textAlign: TextAlign.right,
                            style: Styles.customNormalTextStyle(),
                          ),
                          SpaceW16(),
                          InkWell(
                            onTap: () =>  Get.to(LoginScreen()),
                            child: Text(
                              StringConst.LOGIN,
                              textAlign: TextAlign.left,
                              style: Styles.customNormalTextStyle(
                                color: AppColors.secondaryElement,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSelector() {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.only(top: 28),
        decoration: BoxDecoration(
          color: AppColors.fillColor,
          border: Border.all(
            width: 1,
            color: Color.fromARGB(125, 0, 0, 0),
          ),
          boxShadow: [
            Shadows.secondaryShadow,
          ],
          borderRadius: BorderRadius.all(Radius.circular(76)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50.0),
            Center(
              child: Image.asset(
                ImagePath.personIconMedium,
                fit: BoxFit.none,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                ImagePath.uploadIcon,
                fit: BoxFit.none,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: <Widget>[
        CustomTextFormField(
          hasPrefixIcon: true,
          prefixIconImagePath: ImagePath.personIcon,
          hintText: StringConst.HINT_TEXT_NAME,
        ),
        SpaceH16(),
        CustomTextFormField(
          hasPrefixIcon: true,
          prefixIconImagePath: ImagePath.emailIcon,
          hintText: StringConst.HINT_TEXT_EMAIL,
        ),
        SpaceH16(),
        CustomTextFormField(
          hasPrefixIcon: true,
          prefixIconImagePath: ImagePath.passwordIcon,
          hintText: StringConst.HINT_TEXT_PASSWORD,
          obscured: true,
        ),
        SpaceH16(),
        CustomTextFormField(
          hasPrefixIcon: true,
          prefixIconImagePath: ImagePath.passwordIcon,
          hintText: StringConst.HINT_TEXT_CONFIRM_PASSWORD,
          obscured: true,
        ),
      ],
    );
  }
}
