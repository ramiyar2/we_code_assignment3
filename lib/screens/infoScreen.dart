import 'package:flutter/material.dart';
import '../data/arguments.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              cityInfo(arg),
              backwardIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding backwardIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_outlined,
          size: 25,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Column cityInfo(Arguments arg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(arg.img),
        const SizedBox(
          height: 20,
        ),
        Text(
          arg.cityName,
          style: const TextStyle(fontSize: 20),
        ),
        const Divider(
          thickness: 3,
          indent: 20,
          endIndent: 20,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(arg.cityInfo),
        ),
      ],
    );
  }
}
