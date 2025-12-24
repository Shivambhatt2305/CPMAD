import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  // Observable variables to hold booking data
  RxInt capacity = 0.obs;
  RxDouble price = 0.0.obs;
  TextEditingController capacityTxtController = TextEditingController();
  TextEditingController priceTxtController = TextEditingController();
  void setData() {
    try {
      // Parse the text from the controllers and update the observable variables
      capacity.value = int.parse(capacityTxtController.text);
      price.value = double.parse(priceTxtController.text);
    } catch (e) {
      // Handle parsing errors, e.g., if the input is not a valid number
      print("Error parsing input: $e");
    }
  }

  void test() {
    setData();
  }
}
