import 'package:flutter/material.dart';
import 'package:pelatihan_flutter/constants/constants.dart';
import 'package:pelatihan_flutter/helper/bmi_calculator.dart';
import 'package:pelatihan_flutter/view/bmi_data_screen.dart';

// ignore: camel_case_types
class bmi_result extends StatelessWidget {
  const bmi_result({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  final double bmi;
  // final bmiCalculator? bmiCalculatorHasil;

  @override
  Widget build(BuildContext context) {
    final bmiCalculator bmiHasilCalculator = bmiCalculator.fromBmiValue(bmi);
    bmiHasilCalculator.determinanBMI();
    bmiHasilCalculator.getHealtRisk();

    return Scaffold(
      appBar: AppBar(
        title: const Text("HASIL HITUNG BMI"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Nilai Kamu",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              child: bmi_card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        (bmiHasilCalculator.categoryBMI == null)
                            ? ""
                            : bmiHasilCalculator.categoryBMI!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bmiHasilCalculator.categoryDesc!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.all(
                12.0,
              ),
              height: 70,
              color: Colors.redAccent,
              child: const Center(
                  child: Text(
                "Hitung Ulang BMI",
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
