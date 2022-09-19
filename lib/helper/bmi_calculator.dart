import '../constants/constants.dart';

class bmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? categoryBMI;
  String? categoryDesc;

  bmiCalculator({required this.height, required this.weight});
  bmiCalculator.fromBmiValue(this.bmi);

  double calculateBMI() {
    double heightinMeter = height! / 100;
    final pangkat = heightinMeter * heightinMeter;
    double hasil = weight! / pangkat;
    return hasil;
  }

  determinanBMI() {
    String category = "";

    if (bmi! < 16) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overWeight;
    } else if (bmi! < 35) {
      category = obese1;
    } else if (bmi! < 40) {
      category = obese2;
    } else if (bmi! >= 40) {
      category = obese3;
    }
    categoryBMI = category;

    return categoryBMI;
  }

  getHealtRisk() {
    String desc = "";
    switch (categoryBMI) {
      case underweightSevere:
      case underweightMild:
      case underweightModerate:
        desc = "Posible Nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low Risk (Health Range)";
        break;
      case overWeight:
        desc =
            "Moderate Risk of developing heart disease, high blood pressure, stroke, diabetes melitus";
        break;
      case obese1:
      case obese2:
      case obese3:
        desc =
            "High Risk of developing heart disease, high blood pressure, stroke, diabetes melitus";
        break;
      default:
    }
    categoryDesc = desc;
    return categoryDesc;
  }
}
