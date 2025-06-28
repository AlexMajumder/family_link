import 'dart:async';
import 'package:family_link/features/common/ui/controller/shared_preference_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/app_color.dart';
import '../../../../app/app_constants.dart';
import '../../../common/ui/screens/main_bottom_nab_bar_screen.dart';
import '../widgets/app_logo_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static const name = '/otp-verification';
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSec.obs;
  late Timer? _timer;
  final RxBool _enableResendCodeButton = false.obs;

  void _startResetCodeTime() {
    _remainingTime.value = AppConstants.resendOtpTimeOutInSec;
    _enableResendCodeButton.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        timer.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  SharedPreferencesController sharedPreferencesController =
      Get.find<SharedPreferencesController>();

  @override
  void initState() {
    super.initState();
    _startResetCodeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const AppLogoWidget(),
                  const SizedBox(height: 16),
                  Text(
                    'Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 4 digit otp sent on your mail',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(
                      milliseconds: 300,
                    ), // Pass it here
                    appContext: context,
                    controller: _otpTEController,
                    validator: (String? value) {
                      if (value?.length != 4) {
                        return 'Enter Your Otp';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _onTapNextButton(widget.email);
                    },
                    child: const Text('Next'),
                  ),

                  const SizedBox(height: 24),
                  Obx(
                    () => !_enableResendCodeButton.value
                        ? RichText(
                            text: TextSpan(
                              text: 'This text will expire in ',
                              style: const TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${_remainingTime}s',
                                  style: const TextStyle(
                                    color: AppColors.themeColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Obx(
                    () => TextButton(
                      onPressed: _enableResendCodeButton.value
                          ? () {
                              _startResetCodeTime();
                            }
                          : null,
                      child: const Text('Resend Code'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton(String mail) async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      sharedPreferencesController.saveUserMail(mail);
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainBottomNavScreen.name,
        (predicate) => false,
      );
    }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
