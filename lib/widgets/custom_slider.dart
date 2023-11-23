import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
    required this.value,
    required this.lable,
    required this.screenHeight,
    required this.screenWidth,
    required this.onChanged,
  }) : super(key: key);

  final double value;
  final String lable;
  final double screenHeight;
  final double screenWidth;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: screenWidth * 0.4,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lable,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Button 1
              IconButton(
                onPressed: () {
                  onChanged(-1);
                },
                icon: const Icon(
                  FontAwesomeIcons.squareMinus,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Button 2
              IconButton(
                onPressed: () {
                  onChanged(1);
                },
                icon: const Icon(
                  FontAwesomeIcons.squarePlus,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}