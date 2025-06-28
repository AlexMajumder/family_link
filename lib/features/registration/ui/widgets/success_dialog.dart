import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onOkPressed;

  const SuccessDialog({
    super.key,
    this.title = 'Congratulations!',
    this.message = 'Head registration completed successfully.',
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onOkPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
