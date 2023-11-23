import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../helpers/state_controller.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // double value = 0.0;
  double height = 165;
  double weight = 55;
  double age = 18;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;
    final screenWidth = mediaQuery.size.width;
    final screenHeight = orientation == Orientation.portrait
        ? mediaQuery.size.height
        : mediaQuery.size.width;

    StateController controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocaleText(
                  'bmiCalculator',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //! Choosing Gender section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenderCard(
                      isSelected: isMale,
                      onPressed: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      gender: context.localeString('male'),
                      icon: FontAwesomeIcons.mars,
                      iconColor: Colors.orange,
                    ),
                    GenderCard(
                      isSelected: !isMale,
                      onPressed: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      gender: context.localeString('female'),
                      icon: FontAwesomeIcons.venus,
                      iconColor: Colors.pink,
                    ),
                  ],
                ),

                //! Height picking part
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.25,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${context.localeString('height')} (${context.localeString('incm')})',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Slider(
                        label: '$height',
                        thumbColor: Colors.white,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.green[700],
                        // divisions: 24,
                        min: 100,
                        max: 220,
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value.round().toDouble();
                          });
                        },
                      ),
                      Text(
                        '$height ${context.localeString('cm')}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),

                //! Weight and Age Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSlider(
                      value: weight,
                      lable:
                          '${context.localeString('weight')} (${context.localeString('inkg')})',
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      onChanged: (value) {
                        setState(() {
                          weight += value;
                        });
                      },
                    ),
                    CustomSlider(
                      lable: context.localeString('age'),
                      value: age,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      onChanged: (value) {
                        setState(() {
                          age += value;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.calculateBMI(height: height, weight: weight);
                      showModalBottomSheet(
                        barrierColor: Colors.white.withOpacity(0.2),
                        context: context,
                        builder: (context) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              const LocaleText(
                                'yourbmiis',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${controller.bmi.toStringAsFixed(2)} kg/m²',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              LocaleText(
                                controller.bmiStatus,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LocaleText(
                                  controller.bmiMessage,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const LocaleText(
                      'calculate',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 2,
                        fontFamily: 'Ant',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*
  Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 150,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 50,
                  color: Colors.green,
                ),
                GaugeRange(
                  startValue: 50,
                  endValue: 100,
                  color: Colors.orange,
                ),
                GaugeRange(
                  startValue: 100,
                  endValue: 150,
                  color: Colors.red,
                )
              ],
              pointers: <GaugePointer>[NeedlePointer(value: value)],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '$value',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                )
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              value += 10;
            });
          },
          child: const Text("+ Add"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              value -= 10;
            });
          },
          child: const Text("- Sub"),
        ),
      ],
    ),
  ),
*/
