import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.gender,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;
  final double screenHeight;
  final double screenWidth;
  final String gender;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: isSelected ? 3 : 1,
          ),
        ),
        height: screenHeight * 0.2,
        width: screenWidth * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 50,
            ),
            const SizedBox(height: 10),
            Text(gender),
          ],
        ),
      ),
    );
  }
}
