import 'package:flutter/material.dart';

class ColorFilterInfo {
  final String name;
  final ColorFilter filter;

  const ColorFilterInfo({required this.name, required this.filter});
}

class ColorFilters {
  static const identity = ColorFilterInfo(
    name: 'Стандарт', 
    filter: ColorFilter.matrix([
      1, 0, 0, 0, 0,
      0, 1, 0, 0, 0,
      0, 0, 1, 0, 0,
      0, 0, 0, 1, 0,
    ]),
  );

  static const invert = ColorFilterInfo(
    name: 'Инверсия', 
    filter: ColorFilter.matrix([
        -1,  0,  0, 0, 255,
        0, -1,  0, 0, 255,
        0,  0, -1, 0, 255,
        0,  0,  0, 1,   0,
      ]),
    );

  static const sepia = ColorFilterInfo(
    name: 'Сепия', 
    filter: ColorFilter.matrix([
      0.393, 0.769, 0.189, 0, 0,
      0.349, 0.686, 0.168, 0, 0,
      0.272, 0.534, 0.131, 0, 0,
      0,     0,     0,     1, 0,
    ]),
  );

  static const greyscale = ColorFilterInfo(
    name: 'Черно-белый', 
    filter: ColorFilter.matrix([
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0,      0,      0,      1, 0,
    ]),
  );
}
