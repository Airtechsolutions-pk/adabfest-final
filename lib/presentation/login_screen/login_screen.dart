import '../../data/models/GlobalEvents/EventsModals.dart';
import 'models/login_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/core/utils/validation_functions.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:adabfest/widgets/custom_outlined_button.dart';
import 'package:adabfest/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/login_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:adabfest/domain/googleauth/google_auth_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            decoration: BoxDecoration(
                color: theme.colorScheme.onErrorContainer.withOpacity(1),
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgLogin),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 55.v),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgAgaKhanUniversityLogo99x99,
                              height: 150.adaptSize,
                              width: 150.adaptSize),

                          SizedBox(height: 36.v),
                          _buildSignInForm(context),
                          SizedBox(height: 27.v),
                          SizedBox(height: 33.v),
                          CustomElevatedButton(
                              height: 58.v,
                              text: "lbl_sign_in".tr.toUpperCase(),
                              buttonTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: "Inter"),
                              rightIcon: Container(
                                  padding:
                                      EdgeInsets.fromLTRB(7.h, 8.v, 9.h, 7.v),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.onErrorContainer
                                          .withOpacity(1),
                                      borderRadius:
                                          BorderRadius.circular(14.h)),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgArrowleft,
                                      height: 12.v,
                                      width: 11.h)),
                              buttonStyle: CustomButtonStyles.outlinePrimary,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Apicall(context);
                                }
                              }),
                          SizedBox(height: 22.v),
                              CustomElevatedButton(
                                  height: 58.v,
                                  text: "Admin Login".tr.toUpperCase(),
                                  buttonTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily: "Inter"),
                                  rightIcon: Container(
                                      padding:
                                      EdgeInsets.fromLTRB(7.h, 8.v, 9.h, 7.v),
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.onErrorContainer
                                              .withOpacity(1),
                                          borderRadius:
                                          BorderRadius.circular(14.h)),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgArrowleft,
                                          height: 12.v,
                                          width: 11.h)),
                                  buttonStyle: CustomButtonStyles.login,
                                  onPressed: () {
                                    NavigatorService.pushNamed(
                                      AppRoutes.adminlogin,
                                    );
                                  }),
                              SizedBox(height: 22.v),

                              // GestureDetector(
                              //   onTap: () {
                              //     onTapTxtBuildingBetter(context);
                              //   },
                              //   child: RichText(
                              //       text: TextSpan(children: [
                              //         TextSpan(
                              //             text: "msg_don_t_have_an_account2".tr,
                              //             style:
                              //             CustomTextStyles.titleSmallMedium15),
                              //         TextSpan(
                              //             text: "lbl_sign_up".tr,
                              //             style: CustomTextStyles.titleSmallPrimary)
                              //       ]),
                              //       textAlign: TextAlign.left),
                              // ),

                        ]))))));
  }

  /// Section Widget
  Widget _buildSignInForm(BuildContext context) {
    return Column(
        crossAxisAlignment:   CrossAxisAlignment.start,
        children: [
      Text("Log In".tr,
          style: TextStyle(
              color: appTheme.black900,
              fontSize: 20.fSize,
              fontFamily: 'Bodoni MT',
              fontWeight: FontWeight.w700)),
      SizedBox(height: 19.v),
      Consumer<LoginProvider>(builder: (context, provider, child) {
        return CustomTextFormField(
          onChanged: (value) {
            provider.emailController = value;
          },
          hintText: "lbl_abc_email_com".tr,
          textInputType: TextInputType.emailAddress,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(15.h, 17.v, 9.h, 17.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 22.v,
              width: 21.h,
            ),
          ),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a user name";
            }
            return null;
          },
        );
      }),
      SizedBox(height: 20.v),
      Consumer<LoginProvider>(builder: (context, provider, child) {
        return CustomTextFormField(
          onChanged: (value) {
            provider.passwordController = value;
          },
          hintText: "lbl_your_password".tr,
          textInputType: TextInputType.phone,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(14.h, 17.v, 9.h, 17.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLocation,
              height: 22.adaptSize,
              width: 22.adaptSize,
            ),
          ),

          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          contentPadding: EdgeInsets.symmetric(vertical: 19.v),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a phone number.";
            } else if (value.length < 8) {
              return "phone must be at least 8 characters long.";
            }
            return null;
          },
        );
      }),
    ]);
  }

  /// Section Widget
  Widget _buildOrLine(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 9.v),
              child: SizedBox(
                  width: 128.h, child: Divider(color: appTheme.gray50001))),
          Text("lbl_or".tr,
              style: TextStyle(
                  color: theme.colorScheme.errorContainer,
                  fontSize: 16.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 9.v),
              child: SizedBox(
                  width: 128.h, child: Divider(color: appTheme.gray50001)))
        ]));
  }

  /// Navigates to the homeScreen when the action is triggered.
  void _onGetCustomerLoginUrlEventSuccess(
      [BuildContext? context,]) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.mainPage,
    );
  }

  /// Displays a toast message using the FlutterToast library.


  void Apicall(BuildContext context,) {
    Provider.of<LoginProvider>(context, listen: false).callGetCustomerLoginUrl(
      onSuccess: () {

        _onGetCustomerLoginUrlEventSuccess(context, );
      },
      onError: () {
       Fluttertoast.showToast(msg: "${Provider.of<LoginProvider>(context, listen: false).getGetCustomerLoginUrlResp[0].description}",gravity: ToastGravity.TOP, backgroundColor: Colors.red,fontSize: 13.fSize);
      },
      emailController:
          Provider.of<LoginProvider>(context, listen: false).emailController!,
      passwordController: Provider.of<LoginProvider>(context, listen: false)
          .passwordController!,
    );
  }

  // onTapContinueWithGoogle(BuildContext context, ) async {
  //   await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
  //     if (googleUser != null) {
  //       Provider.of<LoginProvider>(context, listen: false)
  //           .callGetCustomerGoogleUrl(
  //               onSuccess: () {
  //                 _onGetCustomerLoginUrlEventSuccess(context);
  //
  //               },
  //               onError: () {
  //               },
  //               googleemail: googleUser.email);
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text('user data is empty')));
  //     }
  //   }).catchError((onError) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(onError.toString())));
  //   });
  // }
  //
  //
  // omtapapple(BuildContext context,) async {
  //   await AppleAuthHelper().appleSignInProcess().then((appleuser) {
  //     if (appleuser != null) {
  //       Provider.of<LoginProvider>(context, listen: false)
  //           .getapple(
  //           onSuccess: () {
  //             _onGetCustomerLoginUrlEventSuccess(context,);
  //
  //           },
  //           onError: () {
  //           },
  //           googleemail: appleuser.email);
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text('user data is empty')));
  //     }
  //   }).catchError((onError) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(onError.toString())));
  //   });
  // }

  onTapTxtBuildingBetter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }
}
