import 'package:flutter/material.dart';
import 'package:gseemobile/constants.dart';
import 'package:gseemobile/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Gestionnaire de Salles et Matériels",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(350),
        ),
      ],
    );
  }
}
