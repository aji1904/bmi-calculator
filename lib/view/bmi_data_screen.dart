import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pelatihan_flutter/constants/constants.dart';
import 'package:pelatihan_flutter/view/bmi_result_screen.dart';

// ignore: camel_case_types
class bmi_data_screen extends StatefulWidget {
  const bmi_data_screen({Key? key}) : super(key: key);

  @override
  State<bmi_data_screen> createState() => _bmi_data_screenState();
}

// ignore: camel_case_types
class _bmi_data_screenState extends State<bmi_data_screen> {
  int height = 165;
  int weight = 50;
  int age = 20;

  double calculateBMI() {
    double heightinMeter = height / 100;
    final pangkat = pow(heightinMeter, 2);
    double hasil = weight / pangkat;
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xff111318),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Expanded(
                    child: bmi_card(
                      child: gender_icon_text(
                        icon_data: Icons.male,
                        title: 'MALE',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  Expanded(
                    child: bmi_card(
                      child: gender_icon_text(
                          title: "FEMALE", icon_data: Icons.female),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xff111318),
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 12.0,
                left: 12.0,
                right: 12.0,
              ),
              child: bmi_card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelStyle!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberStyle,
                        ),
                        Text(
                          " cm",
                          style: labelStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 50,
                      max: 250,
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      onChanged: ((value) {
                        height = value.toInt();
                        setState(() {});
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: bmi_card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelStyle,
                          ),
                          Text(
                            "$weight",
                            style: numberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              button_action(
                                icon: Icons.add,
                                onpress: (() {
                                  weight++;
                                  setState(() {});
                                }),
                              ),
                              button_action(
                                icon: Icons.remove,
                                onpress: (() {
                                  weight--;
                                  setState(() {});
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                      child: bmi_card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelStyle,
                        ),
                        Text(
                          "$age",
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button_action(
                              icon: Icons.add,
                              onpress: (() {
                                age++;
                                setState(() {});
                              }),
                            ),
                            button_action(
                              icon: Icons.remove,
                              onpress: (() {
                                age--;
                                setState(() {});
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // print(calculateBMI());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return bmi_result(
                      bmi: calculateBMI(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(
                12.0,
              ),
              height: 70,
              color: Colors.redAccent,
              child: const Center(
                  child: Text(
                "Hitung BMI",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class button_action extends StatelessWidget {
  const button_action({
    Key? key,
    this.icon,
    this.onpress,
  }) : super(key: key);

  final IconData? icon;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 0,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Colors.white,
      constraints: BoxConstraints.tightFor(
        width: 35,
        height: 56,
      ),
    );
  }
}

class bmi_card extends StatelessWidget {
  const bmi_card({
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272a4e),
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: child,
    );
  }
}

// ignore: camel_case_types
class gender_icon_text extends StatelessWidget {
  const gender_icon_text({
    Key? key,
    required this.title,
    // ignore: non_constant_identifier_names
    required this.icon_data,
  }) : super(key: key);

  final String title;
  // ignore: non_constant_identifier_names
  final IconData icon_data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon_data,
          size: 80,
          color: Colors.white70,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelStyle,
        )
      ],
    );
  }
}
