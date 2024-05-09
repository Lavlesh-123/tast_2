import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContinentProvider extends ChangeNotifier {
  final String continent;
  late List<Map<String, dynamic>> _countries;
  List<Map<String, dynamic>> _filteredCountries = [];
  bool _isLoading = false;
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> get filteredCountries => _filteredCountries;
  bool get isLoading => _isLoading;

  ContinentProvider(this.continent) {
    _countries = [];
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/all'),
      );

      if (response.statusCode == 200) {
        List<dynamic> countries = jsonDecode(response.body);
        _countries.clear();

        for (var country in countries) {
          if (country['continents'].contains(continent)) {
            _countries.add(country);
          }
        }

        _filteredCountries = List.from(_countries);
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      log('Error fetching countries: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterCountries(String searchText) {
    if (searchText.isEmpty) {
      _filteredCountries = List.from(_countries);
    } else {
      _filteredCountries = _countries.where((country) {
        String name = country['name']['common'].toString().toLowerCase();
        return name.contains(searchText.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
