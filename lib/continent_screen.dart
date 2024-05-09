import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_2/providers/continent_provider.dart';
import 'package:task_2/view/detail_screen.dart';

class ContinentScreen extends StatelessWidget {
  final String continent;

  const ContinentScreen({Key? key, required this.continent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContinentProvider(continent),
      child: _ContinentScreenContent(),
    );
  }
}

class _ContinentScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final continentProvider = Provider.of<ContinentProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text(
          continentProvider.continent,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
              child: TextField(
                controller: continentProvider.searchController,
                onChanged: (value) {
                  continentProvider.filterCountries(value);
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Search Country',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ContinentProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return _buildShimmeringTile();
                } else {
                  return ListView.builder(
                    itemCount: provider.filteredCountries.length,
                    itemBuilder: (context, index) {
                      var country = provider.filteredCountries[index];
                      String countryName = country['name']['common'];
                      String flagUrl = country['flags']['png'];
                      String capital = country['capital'][0] ?? 'Unknown';
                      int? population = country['population'] as int?;
                      String populationString = population.toString();
                      String? region = country['region'] ?? 'Unknown';
                      return _buildCountryTile(context, countryName, flagUrl,
                          capital, populationString, region);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryTile(BuildContext context, String countryName,
      String flagUrl, String capital, String population, String? region) {
    final continentProvider =
        Provider.of<ContinentProvider>(context, listen: false);

    return ListTile(
      onTap: () {
        Map<String, dynamic>? selectedCountry;
        for (var country in continentProvider.filteredCountries) {
          if (country['name']['common'] == countryName) {
            selectedCountry = country;
            break;
          }
        }
        if (selectedCountry != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(country: selectedCountry),
            ),
          );
        }
      },
      leading: Container(
        height: 50,
        width: 80,
        color: Colors.white,
        child: Image.network(
          flagUrl,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(countryName),
      subtitle: Text(capital),
      trailing: Text('Population : ${population.toString()}'),
    );
  }

  Widget _buildShimmeringTile() {
    return ListView.builder(
        itemCount: 25,
        itemBuilder: ((context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              tileColor: Colors.grey.shade300,
              leading: Container(
                width: 80,
                height: 50,
                color: Colors.grey,
              ),
              title: Container(
                width: 150,
                height: 20,
                color: Colors.grey,
              ),
              subtitle: Container(
                width: 50,
                height: 12,
                color: Colors.grey,
              ),
              trailing: Container(
                width: 50,
                height: 12,
                color: Colors.grey,
              ),
            ),
          );
        }));
  }
}
