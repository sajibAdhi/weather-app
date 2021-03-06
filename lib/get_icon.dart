import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetIcon {
  static Icon getIcon(String iconCode) {
    if (iconCode == '01d') {
      return Icon(
        FontAwesomeIcons.solidSun,
        color: Colors.amber,
      );
    } else if (iconCode == '01n') {
      return Icon(
        FontAwesomeIcons.moon,
      );
    } else if (iconCode == '02d') {
      return Icon(
        FontAwesomeIcons.cloudSun,
        color: Colors.amber,
      );
    } else if (iconCode == '02n') {
      return Icon(
        FontAwesomeIcons.cloudMoon,
      );
    } else if (iconCode == '03d' || iconCode == '03n') {
      return Icon(
        FontAwesomeIcons.cloud,
      );
    } else if (iconCode == '04d' || iconCode == '04n') {
      return Icon(
        FontAwesomeIcons.soundcloud,
        color: Colors.grey,
      );
    } else if (iconCode == '09d' || iconCode == '09n') {
      return Icon(
        FontAwesomeIcons.cloudShowersHeavy,
        color: Colors.grey,
      );
    } else if (iconCode == '10d' || iconCode == '10n') {
      return Icon(
        FontAwesomeIcons.cloudRain,
        color: Colors.grey,
      );
    } else if (iconCode == '11d' || iconCode == '11n') {
      return Icon(
        FontAwesomeIcons.wind,
        color: Colors.grey,
      );
    } else if (iconCode == '13d' || iconCode == '13n') {
      return Icon(
        FontAwesomeIcons.snowflake,
        color: Colors.grey,
      );
    } else if (iconCode == '50d' || iconCode == '50n') {
      return Icon(
        FontAwesomeIcons.cloud,
        color: Colors.grey,
      );
    } else {
      return throw Exception('---');
    }
  }
}
