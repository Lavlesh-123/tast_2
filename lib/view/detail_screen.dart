import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/details_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? country;

  const DetailsScreen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsProvider(country),
      child: _DetailsScreenContent(),
    );
  }
}

class _DetailsScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.blue.shade100,
          appBar: AppBar(
            title: const Text(
              'Details',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.blue,
          ),
          body: provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : provider.country == null
                  ? const Center(
                      child: Text('Country data not available.'),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildItem(
                                context, 'Common Name:', provider.common),
                            _buildItem(
                                context, 'Official Name:', provider.official),
                            _buildItem(
                                context, 'Native Name:', provider.nativeName),
                            _buildItem(context, 'Independence :',
                                provider.independent),
                            _buildItem(context, 'Status :', provider.status),
                            _buildItem(
                                context, 'UnMember :', provider.unMember),
                            _buildItem(
                                context, 'Population :', provider.population),
                            _buildItem(context, 'Currency Name :',
                                provider.currencyName),
                            _buildItem(context, 'Capital :', provider.capital),
                            _buildItem(context, 'Resion :', provider.resion),
                            _buildItem(
                                context, 'subregion :', provider.subregion),
                            _buildItem(
                                context, 'languages :', provider.languages),
                            _buildItem(
                                context, 'landlocked :', provider.landlocked),
                            _buildItem(
                                context, 'borders :', provider.borderString),
                            _buildItem(context, 'area :', provider.area),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, String item, dynamic itemName) {
    String displayText = itemName.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              item,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.057,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    displayText,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
