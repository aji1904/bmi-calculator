import 'package:flutter/material.dart';
import 'package:pelatihan_flutter/view/bmi_data_screen.dart';

// ignore: camel_case_types
class bmi_result extends StatelessWidget {
  const bmi_result({Key? key, required this.bmi}) : super(key: key);

  final double bmi;
  

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              padding: EdgeInsets.all(12.0),
              width: double.infinity,
              child: bmi_card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Normal",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${bmi.toStringAsFixed(1)}",
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Skor BMI kamu rendah, kamu harus banyak makan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ]),
              ),
            ),
            flex: 6,
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
