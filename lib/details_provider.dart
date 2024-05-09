import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  final Map<String, dynamic>? country;
  bool _isLoading = false;

  DetailsProvider(this.country) {
    if (country != null) {
      _isLoading = true;
      _loadData();
    }
  }

  bool get isLoading => _isLoading;
  String get common => country?['name']['common'] ?? 'Unknown';
  String get capital => country?['capital']?[0] ?? 'Unknown';
  bool? get independent => country?['independent'] as bool?;
  String get nativeName =>
      country?['name']['official'] ?? 'Unknown';
  String get status => country?['status'] ?? 'Unknown';
  String get official => country?['name']['official'] ?? 'Unknown';
  bool? get unMember => country?['unMember'] as bool?;
  int? get population => country?['population'] as int?;
  String? get currencyName => country?['currencies']?['MDL']?['name'] ?? 'Unknown';
  
  String? get resion => country?['region'] ?? 'Unknown';
  String? get subregion => country?['subregion'] ?? 'Unknown';
  // String? get languages => country?['languages']['ron'] ?? 'Unknown';
  String get languages => country?['languages']['ron'] ?? 'Unknown';
  bool? get landlocked => country?['landlocked'] as bool?;
  List? get borders => country?['borders'];
  String? get borderString =>
      borders != null ? borders?.join(', ') : 'Unknown';
  double? get area => country?['area'] as double?;

  void _loadData() {
    Future.delayed(const Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}