
import 'package:flutter/material.dart';
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
