import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_2/model/country_model.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> _countries = [];
  bool _isLoading = false;

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;

  Future<void> fetchCountriesByContinent(String continent) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/all'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> countriesData = jsonDecode(response.body);

        _countries = countriesData
            .where((country) => country['continents'].contains(continent))
            .map((country) => Country(
                  name: country['name']['common'],
                  capital: country['capital']?[0] ?? 'Unknown',
                  population: country['population'] as int? ?? 0,
                  flagUrl: country['flags']['png'],
                  region: country['region'] ?? 'Unknown',
                ))
            .toList();

        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      log('Error fetching countries: $e');
      _isLoading = false;
      notifyListeners();
    }
  }
}
