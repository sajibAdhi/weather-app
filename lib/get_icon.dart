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
    }
    return Icon(
      FontAwesomeIcons.solidSun,
      color: Colors.amber,
    );
  }
}
