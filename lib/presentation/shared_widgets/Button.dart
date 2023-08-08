import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Icon? icon;
  final Color color;
  final Color TextColor;
  final double? radius;
  final VoidCallback onPressed;

  const CustomButton({
    required this.title,
    this.icon,
    required this.color,
    required this.TextColor,
    this.radius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: radius != null ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(color: TextColor),
          ),
        ],
      ),
    );
  }
}
