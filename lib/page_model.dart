import 'dart:ui';

import 'package:flutter/material.dart';

class PageData{
  final String? title;
  final String? image;
  final Color bdColor;
  final Color txtColor;

  const PageData({
    this.title,
    this.image,
    this.bdColor =  Colors.white,
    this.txtColor =  Colors.black,
  });
}