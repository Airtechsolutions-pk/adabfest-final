import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/core/utils/size_utils.dart';
import 'package:adabfest/data/models/GetUserModel/getuser_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'edit_provider/edit_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EditProfileProvider(), child: EditProfile());
  }
}

class EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    print("----- args ${args.userName}");
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
                              child: Text("Edit Profile".tr,
                                  style: TextStyle(
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: 24.fSize,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500))),
                          SizedBox(height: 12.v),
                          _buildSignUpFullName(context,args),
                          SizedBox(height: 16.v),
                    //      _buildSignUpEmail(context,args),
                          SizedBox(height: 16.v),
                          _buildSignUpPhone(context,args),
                          SizedBox(height: 16.v),
                         _buildSignUpPassword(context,args),
                          SizedBox(height: 16.v),
                          _buildSignUpArrowLeft(context,args),

                          SizedBox(height: 5.v)
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
  Widget _buildSignUpFullName(BuildContext context, User args) {
    return Consumer<EditProfileProvider>(builder: (context, provider, child) {

      return CustomTextFormField(
          // Set the initial text based on the conditions
          initialValue: args.userName,
        onChanged: (value) {
          // Handle the onChanged event, for example, update a variable in your provider
          provider.signUpFullNameController = value;
        },
          prefix: Container(
            margin: EdgeInsets.fromLTRB(15.h, 17.v, 12.h, 17.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLock,
              height: 22.v,
              width: 21.h,
            ),
          ),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || (!isText(value, isRequired: true))) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
        );
      },
    );
  }


  /// Section Widget
  Widget _buildSignUpEmail(BuildContext context ,User args) {
    return Consumer<EditProfileProvider>(builder: (context, provider, child) {

      return CustomTextFormField(
              initialValue: args.email,
          onChanged: (value) {
            // Handle the onChanged event, for example, update a variable in your provider
            provider.signUpEmailController = value;
          },
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
  Widget _buildSignUpPhone(BuildContext context ,User args) {
    return Consumer<EditProfileProvider>(builder: (context, provider, child) {

      return CustomTextFormField(
              initialValue: args.contactNo,
          onChanged: (value) {
            // Handle the onChanged event, for example, update a variable in your provider
            provider.signUpPhoneController = value;
          },
          textInputType: TextInputType.phone,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(15.h, 18.v, 12.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSmartphone,
                      height: 22.adaptSize,
                      width: 22.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null || (!isValidPhone(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              });

        });
  }

  /// Section Widget
  Widget _buildSignUpPassword(BuildContext context ,User args) {
    return Consumer<EditProfileProvider>(builder: (context, provider, child) {
      return CustomTextFormField(
          initialValue: args.password,
          onChanged: (value) {
            // Handle the onChanged event, for example, update a variable in your provider
            provider.signUpPasswordController = value;
          },
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 17.v, 12.h, 17.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 22.v,
                  width: 21.h)),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          suffix: InkWell(
              onTap: () {
                provider.changePasswordVisibility();
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 15.h, 18.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEyeoff,
                      height: 20.adaptSize,
                      width: 20.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: provider.isShowPassword,
          contentPadding: EdgeInsets.symmetric(vertical: 19.v));
    });
  }

  /// Section Widget

  /// Section Widget
  Widget _buildSignUpArrowLeft(BuildContext context,User args) {
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
            Apicall(context,args);
          }
        });
  }
  /// Navigates to the previous screen.
  onTapImgVector(BuildContext context) {
    NavigatorService.goBack();
  }

  void Apicall(BuildContext context, User args) async {
    EditProfileProvider signUpProvider = Provider.of<EditProfileProvider>(context, listen: false);
    int? userId = await signUpProvider.getUserId();

    // Show loader before making the API call
    showLoader(context);

    signUpProvider.callPostCustomerSignup(
      onSuccess: () {
        // Dismiss loader when API call succeeds
        Navigator.of(context).pop(); // Dismiss loader
        _onGetCustomerLoginUrlEventSuccess(context);
      },
      phone: args.contactNo,
      name: args.userName,
      password: args.password,
      uid: userId,
      onError: () {
        // Dismiss loader when API call fails
        Navigator.of(context).pop(); // Dismiss loader
        _onGetCustomerLoginUrlEventError(context);
      },
    );
  }



  void _onGetCustomerLoginUrlEventSuccess([BuildContext? context]) {
    NavigatorService.pushNamed(
      AppRoutes.mainPage,
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
    Fluttertoast.showToast(
      msg: "Error",
    );
    Fluttertoast.showToast(
      msg: "Error",
    );
  }
}
