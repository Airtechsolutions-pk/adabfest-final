import 'package:fluttertoast/fluttertoast.dart';

import '../../data/models/GlobalEvents/EventsModals.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_radio_button.dart';
import '../e_pass_downlaod_two_screen/provider/e_pass_downlaod_two_provider.dart';
import 'models/registration_model.dart';
import 'package:adabfest/core/app_export.dart';
import 'package:adabfest/core/utils/validation_functions.dart';
import 'package:adabfest/widgets/custom_elevated_button.dart';
import 'package:adabfest/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/registration_provider.dart';
import 'package:adabfest/presentation/congratulation_dialog/congratulation_dialog.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegistrationProvider(),
        child: RegistrationScreen());
  }
}

// ignore_for_file: must_be_immutable
class RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 58.h,
        backgroundColor: Color(0xffE30512),

        leading: AppbarLeadingImage(
          onTap: (){
            NavigatorService.goBack();
          },
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.only(left: 1.h, top: 9.v, bottom: 26.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_all_regist".tr,

            margin: EdgeInsets.only( top: 9.v, bottom: 26.v)),


        actions: [

        ],
        styleType: Style.bgFill);
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Events;

    return Scaffold(

        backgroundColor: appTheme.gray50,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                    key: _formKey,
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Column(children: [
                          SizedBox(height: 20.v),
                          _buildConferenceSection(context,args),
                          SizedBox(height: 5.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 21.h),
                                  child: Text(
                                      "${args.name}".tr,
                                      style: TextStyle(
                                          color:
                                              theme.colorScheme.onPrimary,
                                          fontSize: 24.fSize,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500)))),
                          SizedBox(height: 17.v),
                          _buildFullNameSection(context),
                          SizedBox(height: 16.v),
                          _buildEmailSection(context),
                          SizedBox(height: 16.v),
                          _buildPhoneSection(context),
                          SizedBox(height: 16.v),
                          SizedBox(height: 8.v),
                          _buildOccupationValueEditTextSection(context),
                          SizedBox(height: 23.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.h, right: 20.h),
                                  child: Row(children: [
                                    Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 1.v),
                                        child: Text("lbl_gender".tr,
                                            style: theme
                                                .textTheme.titleSmall)),
                                    _buildGenderRadioGroupSection(context)
                                  ]))),
                          SizedBox(height: 54.v),
                          SizedBox(height: 5.v)
                        ]))))),
    bottomNavigationBar: Container(
      child:                           _buildSubmitSection(context,args.eventID),

    ),

    );
  }
  Widget _buildOccupationValueEditTextSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Selector<RegistrationProvider, TextEditingController?>(
            selector: (context, provider) =>
            provider.occupationValueEditTextSectionController,
            builder:
                (context, occupationValueEditTextSectionController, child) {
              return CustomTextFormField(
                  controller: occupationValueEditTextSectionController,
                  hintText: "lbl_occupation".tr,
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(17.h, 19.v, 14.h, 19.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgBriefcase,
                          height: 18.adaptSize,
                          width: 18.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 56.v));
            }));
  }

  /// Section Widget
  /// Section Widget
  Widget _buildGenderRadioGroupSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 75.h),
        child:
        Consumer<RegistrationProvider>(builder: (context, provider, child) {
          return provider!.radioList.isNotEmpty
              ? Row(children: [
            CustomRadioButton(
                text: "lbl_male".tr,
                value: provider?.radioList[0] ?? "",
                groupValue: provider.genderRadioGroupSection,
                onChange: (value) {
                  provider.changeRadioButton1(value);
                }),
            Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: CustomRadioButton(
                    text: "lbl_female".tr,
                    value:
                    provider?.radioList[1] ?? "",
                    groupValue: provider.genderRadioGroupSection,
                    onChange: (value) {
                      provider.changeRadioButton1(value);
                    }))
          ])
              : Container();
        }));
  }
  /// Section Widget
  Widget _buildConferenceSection(BuildContext context,Events args) {
    return CustomElevatedButton(
        height: 29.v,
        width: 88.h,
        text: "${args.type}".tr,
        buttonTextStyle: TextStyle(
          color: Colors.grey.shade200
        ),
        margin: EdgeInsets.only(left: 21.h),
        buttonStyle: CustomButtonStyles.fillGray,
        alignment: Alignment.centerLeft);
  }
  void Apicall(BuildContext context,eventid) async {
    RegistrationProvider registrationProvider = Provider.of<RegistrationProvider>(context, listen: false);
    int? userId =
        await Provider.of<RegistrationProvider>(context, listen: false)
        .getUserId();


    registrationProvider.callPostCustomerSignup(
      eventid: eventid,
      uid: userId,

      onSuccess: () {
        onTapSubmitSection(context);

      },
      onError: () {
        _onGetCustomerLoginUrlEventError(context);
      },
    );
  }

  void _onGetCustomerLoginUrlEventSuccess([BuildContext? context]) {
    NavigatorService.pushNamed(
      AppRoutes.mainPage,
    );
  }

  /// Displays a toast message using the FlutterToast library.
  void _onGetCustomerLoginUrlEventError([BuildContext? context]) {
    Fluttertoast.showToast(
      msg: "Already Exist",
    );

  }
  /// Section Widget
  Widget _buildFullNameSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child:         Consumer<RegistrationProvider>(builder: (context, provider, child) {
          return CustomTextFormField(
              onChanged: (value) {
                // Handle the onChanged event, for example, update a variable in your provider
                provider.fullNameSectionController = value;
              },
                  hintText: "lbl_full_name2".tr,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(15.h, 17.v, 12.h, 17.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 22.v,
                          width: 21.h)),
                  prefixConstraints: BoxConstraints(maxHeight: 56.v),
                  validator: (value) {
                    if (!isText(value)) {
                      return "err_msg_please_enter_valid_text".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 21.h, right: 20.h),
        child:          Consumer<RegistrationProvider>(builder: (context, provider, child) {
          return CustomTextFormField(
              onChanged: (value) {
                // Handle the onChanged event, for example, update a variable in your provider
                provider.emailSectionController = value;
              },
                  hintText: "lbl_abc_email_com".tr,
                  textInputType: TextInputType.emailAddress,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(14.h, 17.v, 13.h, 17.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 22.v,
                          width: 21.h)),
                  prefixConstraints: BoxConstraints(maxHeight: 56.v),
                  validator: (value) {
                    if (value == null) {
                      return "err_msg_please_enter_valid_email".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildPhoneSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child:          Consumer<RegistrationProvider>(builder: (context, provider, child) {
          return CustomTextFormField(
              onChanged: (value) {
                // Handle the onChanged event, for example, update a variable in your provider
                provider.phoneSectionController = value;
              },
                  hintText: "lbl_phone_no2".tr,
                  textInputType: TextInputType.phone,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(15.h, 18.v, 12.h, 16.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSmartphone,
                          height: 22.adaptSize,
                          width: 22.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 56.v),
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "err_msg_please_enter_valid_phone_number".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child:
            Consumer<RegistrationProvider>(builder: (context, provider, child) {
          return CustomTextFormField(
              onChanged: (value) {
                // Handle the onChanged event, for example, update a variable in your provider
                provider.passwordSectionController = value;
              },
              hintText: "lbl_your_password2".tr,
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
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: provider.isShowPassword,
              contentPadding: EdgeInsets.symmetric(vertical: 19.v));
        }));
  }

  /// Section Widget
  Widget _buildConfirmPasswordSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 21.h, right: 20.h),
        child:
            Consumer<RegistrationProvider>(builder: (context, provider, child) {
          return CustomTextFormField(
              onChanged: (value) {
                // Handle the onChanged event, for example, update a variable in your provider
                provider.confirmPasswordSectionController = value;
              },
              hintText: "msg_confirm_password2".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(15.h, 17.v, 10.h, 17.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLocation,
                      height: 22.v,
                      width: 21.h)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              suffix: InkWell(
                  onTap: () {
                    provider.changePasswordVisibility1();
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 18.v, 15.h, 18.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgEyeoffPrimary,
                          height: 20.adaptSize,
                          width: 20.adaptSize))),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: provider.isShowPassword1,
              contentPadding: EdgeInsets.symmetric(vertical: 19.v));
        }));
  }


  /// Section Widget
  Widget _buildSubmitSection(BuildContext context,eventid) {
    return CustomElevatedButton(
        height: 58.v,
        text: "lbl_submit".tr.toUpperCase(),
        buttonTextStyle: TextStyle(color: Colors.white,fontSize: 18.fSize),
        margin: EdgeInsets.only(left: 21.h, right: 20.h,bottom: 30.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Apicall(context, eventid);
          }
        });
  }



  /// Displays a dialog with the [CongratulationDialog] content.
  onTapSubmitSection(BuildContext context) {
    showDialog(
        context: context,

        builder: (_) => AlertDialog(

              content: CongratulationDialog.builder(context),

              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,

              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
