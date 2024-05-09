// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//       appBar: AppBar(
//         title: const Text(
//           'HOME',
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildContinent(context, 'Asia'),
//             _buildContinent(context, 'Europe'),
//             _buildContinent(context, 'Africa'),
//             _buildContinent(context, 'Americas'),
//             _buildContinent(context, 'Oceania'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildContinent(BuildContext context, String title) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ContinentScreen(continent: title),
//             ),
//           );
//         },
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.09,
//           width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.blue.shade400),
//           child: Padding(
//               padding: const EdgeInsets.only(right: 10.0, left: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Icon(
//                     Icons.language,
//                     color: Colors.white,
//                     size: 50,
//                   ),
//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 30, color: Colors.white),
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }

// class ContinentScreen extends StatefulWidget {
//   final String continent;

//   const ContinentScreen({Key? key, required this.continent}) : super(key: key);

//   @override
//   _ContinentScreenState createState() => _ContinentScreenState();
// }

// class _ContinentScreenState extends State<ContinentScreen> {
//   late List<Map<String, dynamic>> _filteredCountries;
//   final TextEditingController _searchController = TextEditingController();
//   bool _isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//     _filteredCountries = [];
//     _searchController.addListener(_filterCountries);
//     _fetchCountries();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _fetchCountries() async {
//     try {
//       setState(() {
//         _isLoading = true;
//       });

//       List<Map<String, dynamic>> countries =
//           await fetchCountriesByContinent(widget.continent);

//       setState(() {
//         _filteredCountries = countries;
//         _isLoading =
//             false; 
//       });
//     } catch (e) {
//       log('Error fetching countries: $e');
//       // Handle error
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _filterCountries() {
//     setState(() {
//       String searchText = _searchController.text.toLowerCase();
//       if (searchText.isEmpty) {
//         _fetchCountries(); // If search text is empty, fetch all countries again
//       } else {
//         _filteredCountries = _filteredCountries.where((country) {
//           String name = country['name']['common'].toString().toLowerCase();
//           return name.contains(searchText);
//         }).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//       appBar: AppBar(
//         title: Text(
//           widget.continent,
//           style: const TextStyle(fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               height: 50,
//               width: MediaQuery.of(context).size.width *0.8,
//               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(7)),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   labelText: 'Search Country',
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: _isLoading
//                 ?  const Center(child: CircularProgressIndicator(),)
//                 : ListView.builder(
//                     itemCount: _filteredCountries.length,
//                     itemBuilder: (context, index) {
//                       String countryName =
//                           _filteredCountries[index]['name']['common'];
//                       String flagUrl =
//                           _filteredCountries[index]['flags']['png'];
//                       // String capital = country!['capital']?[0] ?? 'Unknown';
//                       String capital =
//                           _filteredCountries[index]['capital'][0] ?? 'Unknown';
//                       int? population =
//                           _filteredCountries[index]['population'] as int?;
//                       String populationString = population.toString();
//                       String? resion =
//                           _filteredCountries[index]['region'] ?? 'Unknown';
//                       return _buildCountryTile(context, countryName, flagUrl,
//                           capital, populationString, resion);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCountryTile(BuildContext context, String countryName,
//       String flagUrl, String capital, String population, String? region) {
//     return ListTile(
//       onTap: () {
//         Map<String, dynamic>? selectedCountry;
//         for (var country in _filteredCountries) {
//           if (country['name']['common'] == countryName) {
//             selectedCountry = country;
//             break;
//           }
//         }
//         if (selectedCountry != null) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailsScreen(country: selectedCountry),
//             ),
//           );
//         }
//       },
//       leading: Container(
//         height: 50,
//         width: 80,
//         color: Colors.blue,
//         child: Image.network(
//           flagUrl,
//           fit: BoxFit.cover,
//         ),
//       ),
//       title: Text(countryName),
//       subtitle: Text(capital),
//       trailing: Column(
//         children: [
//           Text(population.toString()),
//           Text(region.toString()),
//         ],
//       ),
//     );
//   }
// }

// Future<List<Map<String, dynamic>>> fetchCountriesByContinent(
//     String continent) async {
//   final response =
//       await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
//   if (response.statusCode == 200) {
//     List<dynamic> countries = jsonDecode(response.body);
//     List<Map<String, dynamic>> countriesOfContinent = [];

//     for (var country in countries) {
//       if (country['continents'].contains(continent)) {
//         countriesOfContinent.add(country);
//       } else {
//         const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     }

//     return countriesOfContinent;
//   } else {
//     throw Exception('Failed to load countries');
//   }
// }

// class DetailsScreen extends StatelessWidget {
//   final Map<String, dynamic>? country;

//   const DetailsScreen({Key? key, required this.country}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log('Country details: $country');

//     if (country == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Details'),
//         ),
//         body: const Center(
//           child: Text('Country data not available.'),
//         ),
//       );
//     }
//     String common = country!['name']['common'] ?? 'Unknown';
//     String capital = country!['capital']?[0] ?? 'Unknown';
//     bool? independent = country!['independent'] as bool?;
//     String? nativeName;
//     if (country!['name']['nativeName'] != null &&
//         country!['name']['nativeName']['ron'] != null) {
//       nativeName = country!['name']['nativeName']['ron']['official'];
//     } else {
//       nativeName = 'Unknown';
//     }
//     String status = country!['status'] ?? 'Unknown';
//     String official = country!['name']['official'] ?? 'Unknown';
//     bool? unMember = country!['unMember'] as bool?;
//     int? population = country!['population'] as int?;
//     String? currencyName;
//     if (country!['currencies'] != null &&
//         country!['currencies']['MDL'] != null) {
//       currencyName = country!['currencies']['MDL']['name'];
//     } else {
//       currencyName = 'Unknown';
//     }

//     String? resion = country!['region'] ?? 'Unknown';
//     String? subregion = country!['subregion'] ?? 'Unknown';
//     String? languages = country!['languages']['ron'] ?? 'Unknown';
//     bool? landlocked = country!['landlocked'] as bool?;
//     List? borders = country!['borders'];
//     String borderString = borders != null ? borders.join(', ') : 'Unknown';

//     double? area = country!['area'] as double?;

//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//       appBar: AppBar(
//         title: const Text(
//           'Details',
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildItem(context, 'Common Name:', common),
//               _buildItem(context, 'Official Name:', official),
//               _buildItem(context, 'Native Name:', nativeName),
//               _buildItem(context, 'Independence :', independent),
//               _buildItem(context, 'Status :', status),
//               _buildItem(context, 'UnMember :', unMember),
//               _buildItem(context, 'Population :', population),
//               _buildItem(context, 'Currency Name :', currencyName),
//               // _buildItem(context, 'Currencie Symbol :', currencieSymbol),
//               _buildItem(context, 'Capital :', capital),
//               _buildItem(context, 'Resion :', resion),
//               _buildItem(context, 'subregion :', subregion),
//               _buildItem(context, 'languages :', languages),
//               _buildItem(context, 'landlocked :', landlocked),
//               _buildItem(context, 'borders :', borderString),
//               _buildItem(context, 'area :', area),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildItem(BuildContext context, String item, dynamic itemName) {
//     String displayText = itemName.toString();
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             Text(
//               item,
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(width: 30),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.057,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 2, color: Colors.blue),
//                   borderRadius: BorderRadius.circular(7)),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     displayText,
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/continent_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContinent(context, 'Asia'),
            _buildContinent(context, 'Europe'),
            _buildContinent(context, 'Africa'),
            _buildContinent(context, 'Americas'),
            _buildContinent(context, 'Oceania'),
          ],
        ),
      ),
    );
  }

  Widget _buildContinent(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContinentScreen(continent: title),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue.shade400,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeProvider extends ChangeNotifier {

  String _selectedContinent = '';

  String get selectedContinent => _selectedContinent;

  void selectContinent(String continent) {
    _selectedContinent = continent;
    notifyListeners(); // Notify listeners that the state has changed
  }
}
