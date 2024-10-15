// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Context {
  // COLORS
  static Color backgroundColor = const Color.fromRGBO(53, 53, 53, 1);
  static Color primaryColor = const Color.fromRGBO(83, 80, 79, 1);
  static Color secondaryColor = const Color.fromRGBO(50, 50, 50, 1);
  static Color actionColor = const Color.fromRGBO(82, 157, 255, 1);
  static Color semiTransparentWhite = const Color.fromRGBO(255, 255, 255, 0.5);
  static Color successColor = const Color.fromRGBO(51, 199, 51, 1);

  // TEXT STYLES
  static TextStyle defaultTextStyle = const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);
  static TextStyle smallTextStyle = const TextStyle(color: Colors.white, fontSize: 17.5, fontWeight: FontWeight.w500);

  // SPACING
  static double pagePadding = 20;

  static void mergeContext(PartialContext partialContext) {
    // COLORS
    backgroundColor = partialContext.backgroundColor ?? backgroundColor;
    primaryColor = partialContext.primaryColor ?? primaryColor;
    secondaryColor = partialContext.secondaryColor ?? secondaryColor;
    actionColor = partialContext.actionColor ?? actionColor;
    semiTransparentWhite = partialContext.semiTransparentWhite ?? semiTransparentWhite;
    successColor = partialContext.successColor ?? successColor;
    
    // TEXT STYLES
    defaultTextStyle = partialContext.defaultTextStyle ?? defaultTextStyle;
    smallTextStyle = partialContext.smallTextStyle ?? smallTextStyle;

    // SPACING
    pagePadding = partialContext.pagePadding ?? pagePadding;
  }
}

class PartialContext {
  // COLORS
  final Color? backgroundColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? actionColor;
  final Color? semiTransparentWhite;
  final Color? successColor;

  // TEXT STYLES
  final TextStyle? defaultTextStyle;
  final TextStyle? smallTextStyle;

  // SPACING
  final double? pagePadding;
  
  const PartialContext({
    this.backgroundColor,
    this.primaryColor,
    this.secondaryColor,
    this.actionColor,
    this.semiTransparentWhite,
    this.successColor,
    this.defaultTextStyle,
    this.smallTextStyle,
    this.pagePadding
  });
}