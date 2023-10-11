import 'package:flutter/material.dart';

class TabTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isActive;
  const TabTextButton(
      {super.key,
      required this.title,
      this.isActive = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 40,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Spacer(),
                if (isActive)
                  Container(
                    color: Colors.green.shade900,
                    width: double.maxFinite,
                    height: 2,
                  ),
              ],
            ),
            Text(
              title,
              style: TextStyle(
                  color: isActive ? Colors.green.shade900 : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
