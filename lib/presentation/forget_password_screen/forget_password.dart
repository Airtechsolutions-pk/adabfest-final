import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/core/utils/size_utils.dart';
import 'package:adabfest/data/models/GetUserModel/getuser_model.dart';
import 'package:adabfest/presentation/forget_password_screen/provider/forget_provider.dart';
import 'package:adabfest/presentation/forget_password_screen/provider/forgetpop.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  forgetPasswordState createState() => forgetPasswordState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => forgetPasswordProvider(), child: forgetPassword());
  }
}

class forgetPasswordState extends State<forgetPassword> {
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
        appBar: _buildAppBar(context),
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
                            horizontal: 20.h, vertical: 130.v),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Forgot Password".tr,
                                  style: TextStyle(
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: 24.fSize,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500))),
                          SizedBox(height: 16.v),
                          _buildSignUpEmail(context),

                          SizedBox(height: 30.v),
                          _buildSignUpArrowLeft(context),

                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 40.v,
        backgroundColor: Colors.transparent,
        leadingWidth: 374.h,
        leading:  CustomImageView(
            imagePath: ImageConstant.imgVectorOnprimary,

            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 23.h),
            onTap: () {
              onTapImgVector(context);
            }));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildSignUpEmail(BuildContext context ) {
    return Consumer<forgetPasswordProvider>(builder: (context, provider, child) {

      return CustomTextFormField(
          initialValue: provider.signUpEmailController,
          onChanged: (value) {
            // Handle the onChanged event, for example, update a variable in your provider
            provider.signUpEmailController = value;
          },
          hintText: "abc@email.com",

          textInputType: TextInputType.emailAddress,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(14.h, 17.v, 13.h, 17.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 22.v,
                  width: 21.h)),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          });
    });
  }


  /// Section Widget

  /// Section Widget
  Widget _buildSignUpArrowLeft(BuildContext context) {
    return CustomElevatedButton(

        height: 58.v,



        text: "Update".tr.toUpperCase(),

        buttonTextStyle: TextStyle(color: Colors.white,

            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: "Inter"),
        rightIcon: Container(


            padding: EdgeInsets.fromLTRB(
                7.h, 8.v, 9.h, 7.v),
            margin: EdgeInsets.only(right: 10.h),
            decoration: BoxDecoration(
                color: theme
                    .colorScheme.onErrorContainer
                    .withOpacity(1),
                borderRadius:
                BorderRadius.circular(14.h)),
            child: CustomImageView(
                imagePath:
                ImageConstant.imgArrowleft,
                height: 12.v,
                width: 11.h)),
        buttonStyle:
        CustomButtonStyles.outlinePrimary,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Apicall(context);
          }
        });
  }
  /// Navigates to the previous screen.
  onTapImgVector(BuildContext context) {
    NavigatorService.goBack();
  }

  void Apicall(BuildContext context, ) async {
    forgetPasswordProvider signUpProvider = Provider.of<forgetPasswordProvider>(context, listen: false);

    showLoader(context);

    signUpProvider.calluserapi(
      onSuccess: () {
        // Dismiss loader when API call succeeds
        Navigator.of(context).pop(); // Dismiss loader
        _onGetCustomerLoginUrlEventSuccess(context);
      },
      email: signUpProvider.signUpEmailController,
      onError: () {
        // Dismiss loader when API call fails
        Navigator.of(context).pop(); // Dismiss loader
        _onGetCustomerLoginUrlEventError(context);
      },
    );
  }

  void _onGetCustomerLoginUrlEventSuccess([BuildContext? context]) {

    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return ForgetPass();
      },
    );

  }

  void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(), // You can customize the loader widget
        );
      },
    );
  }
  /// Displays a toast message using the FlutterToast library.
  void _onGetCustomerLoginUrlEventError([BuildContext? context]) {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return ForgetPassError();
      },
    );

  }
}
