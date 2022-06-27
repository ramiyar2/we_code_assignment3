import 'package:flutter/material.dart';
import 'data/arguments.dart';
import 'screens/infoScreen.dart';
import 'data/data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/infoScreen': (context) => const InfoScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kurdistan cities',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
          itemCount: cityData.length,
          itemBuilder: ((context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/infoScreen',
                    arguments: Arguments(
                        cityData[index]['img'].toString(),
                        cityData[index]['cityName'].toString(),
                        cityData[index]['cityInfo'].toString())),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      cityImg(index),
                      cityName(index),
                    ],
                  ),
                ),
              ))),
    );
  }

  Container cityName(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.only(top: 180),
      child: Text(cityData[index]['cityName'].toString()),
    );
  }

  Container cityImg(int index) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              cityData[index]['img'].toString(),
            )),
      ),
      width: double.infinity,
      child: null,
    );
  }
}
