import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 800 &&
    MediaQuery.of(context).size.width >= 650;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 800;
