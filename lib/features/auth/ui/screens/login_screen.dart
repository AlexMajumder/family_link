import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../widgets/app_logo_widget.dart';
import 'otp_verification_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static const name = '/log-in-screen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    'Welcome',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Enter your email address',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email address';
                      }
                      if (!EmailValidator.validate(value!)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        OtpVerificationScreen.name,
        arguments: _emailTEController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
