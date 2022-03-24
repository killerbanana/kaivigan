import 'package:flutter/material.dart';
import 'package:kaivigan_2022/services/wrapper.dart';
import 'package:kaivigan_2022/ui/dash/dash_layout.dart';
import 'package:kaivigan_2022/ui/emergency/emergency_layout.dart';
import 'package:kaivigan_2022/ui/parking/parking_layout.dart';
import 'package:kaivigan_2022/ui/waste/waste_found.dart';
import 'package:kaivigan_2022/ui/waste/waste_layout.dart';
import 'package:kaivigan_2022/ui/waste/waste_locator.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => const Wrapper(),
  DashLayout.routeName: (context) => const DashLayout(),
  ParkingLayout.routeName: (context) => const ParkingLayout(),
  WasteLayout.routeName: (context) => const WasteLayout(),
  EmergencyLayout.routeName: (context) => const EmergencyLayout(),
  WasteLocator.routeName: (context) => const WasteLocator(),
  WasteFound.routeName: (context) => const WasteFound(),
};
