
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContinent(context,'Asia'),
            _buildContinent(context,'Europe'),
            _buildContinent(context,'Africa'),
            _buildContinent(context,'Americas'),
            _buildContinent(context,'Oceania'),
          ],
        ),
      ),
    );
  }
      Widget _buildContinent(BuildContext context,String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: (){
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
              color: Colors.blue.shade400),
          child: Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.public,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ContinentScreen extends StatelessWidget {
  final String continent;

  const ContinentScreen({super.key, required this.continent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(continent),
      ),
      body: FutureBuilder(
        future: fetchCountriesByContinent(continent),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, String>> countries =
                  snapshot.data as List<Map<String, String>>;
              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 45,width: 70,
                      child: Image.network(Uri.parse(countries[index]['flag']!)
                          .toString()),
                    ), // Convert the URL to Uri
                    title: Text(countries[index]['name']!),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

}

Future<List<Map<String, String>>> fetchCountriesByContinent(
    String continent) async {
  final response =
      await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
  if (response.statusCode == 200) {
    List<dynamic> countries = jsonDecode(response.body);
    List<Map<String, String>> countriesOfContinent = [];

    for (var country in countries) {
      if (country['continents'].contains(continent)) {
        countriesOfContinent.add({
          'name': country['name']['common'],
          'flag': country['flags']['png'], // Assuming you want PNG flags
        });
      }
    }

    return countriesOfContinent;
  } else {
    throw Exception('Failed to load countries');
  }
}
