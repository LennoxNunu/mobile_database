import 'package:flutter/widgets.dart';

class SizeConfig {
  final BoxConstraints _boxConstraints;
  final Orientation _orientation;

  SizeConfig(this._boxConstraints, this._orientation) {
    init(_boxConstraints, _orientation);
  }

  double _textMultiplier = 0;
  double _imageSizeMultiplier = 0;
  double _heightMultiplier = 0;
  double _widthMultiplier = 0;

  double textMultiplierr() {
    init(_boxConstraints, _orientation);
    return _textMultiplier;
  }

  double imageSizeMultiplierr() {
    init(_boxConstraints, _orientation);
    return _imageSizeMultiplier;
  }

  double heightMultiplierr() {
    init(_boxConstraints, _orientation);
    return _heightMultiplier;
  }

  double widthMultiplierr() {
    init(_boxConstraints, _orientation);
    return _widthMultiplier;
  }

  void init(BoxConstraints constraints, Orientation orientation) {
    double screenWidth = constraints.maxWidth;
    double screenHeight = constraints.maxHeight;

    double blockWidth = screenWidth / 100;
    double blockHeight = screenHeight / 100;

    _textMultiplier = blockHeight;
    _imageSizeMultiplier = blockWidth;
    _heightMultiplier = blockHeight;
    _widthMultiplier = blockWidth;
  }
}
