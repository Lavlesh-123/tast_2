import 'package:flutter/material.dart';
import 'package:task_2/continent_screen.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  Color shadowColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    for (double i = 1; i < 3; i++)
                      BoxShadow(
                          spreadRadius: -3,
                          color: shadowColor,
                          blurRadius: 3 * i,
                          blurStyle: BlurStyle.outer)
                  ],
                  // borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.50),
                      ])),
              child: const SafeArea(
                  child: Center(
                      child: Text(
                'Home',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            _buildContinent(context, 'Asia'),
            _buildContinent(context, 'Europe'),
            _buildContinent(context, 'Africa'),
            _buildContinent(context, 'Americas'),
            _buildContinent(context, 'Oceania'),
          ],
        )
      ]),
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
              boxShadow: [
                for (double i = 1; i < 3; i++)
                  BoxShadow(
                      spreadRadius: -3,
                      color: shadowColor,
                      blurRadius: 3 * i,
                      blurStyle: BlurStyle.outer)
              ],
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.50),
                  ])),
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.language,
                  color: Colors.black,
                  size: 50,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
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
