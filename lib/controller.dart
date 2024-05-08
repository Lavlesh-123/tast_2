import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_2/models/model.dart';

// class HomeController extends GetxController {
//   final TextEditingController searchController = TextEditingController();
//   var countriesList = RxList<UserModel>();

//   @override
//   void onInit() {
//     super.onInit();
//     getCountryData();
//   }

//   Future<void> getCountryData() async {
//       final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         countriesList.assignAll(data.map((json) => UserModel.fromJson(json)).toList());

//         log(response.body.toString());
//       } else {
//         throw Exception('Failed to load data');
//       }
  
//   }
// }


class HomeController extends GetxController {
  var countryName = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://restcountries.com/v3.1/all'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final Map<String, dynamic> firstCountryData = data.isNotEmpty ? data[1] : {};
        countryName.value = firstCountryData.containsKey('name') && firstCountryData['name'].containsKey('common')
            ? firstCountryData['name']['common']
            : "Unknown";
      } else {
        throw Exception('Failed to Load data');
      }
    } catch (e) {
      print('Error $e');
    }
  }
}

