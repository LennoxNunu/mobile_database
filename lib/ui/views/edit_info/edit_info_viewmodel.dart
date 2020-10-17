import 'package:flutter/material.dart';
import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditInfoViewModel extends BaseViewModel {
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final _formKeyThree = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();
  Individual editPositionOnRegisteredlist;
  List<Individual> _updatedValueFromList = List<Individual>();

  String _name;
  String _surname;
  bool _isMale;
  var _dateTime = DateTime.now();
  String myActivity;

  get formKeyOne => _formKeyOne;
  get formKeyTwo => _formKeyTwo;
  get formKeyThree => _formKeyThree;

  String nameValidator(String input) {
    return input.length < 2 ? 'Name required' : null;
  }

  void nameOnsaved(String input) {
    _name = input;
  }

  String surnameValidator(String input) {
    return input.length < 2 ? 'Surname required' : null;
  }

  void surnameOnsaved(String input) {
    _surname = input;
  }

//start practice here

  void genderOnChanged(input) {
    myActivity = input;
    notifyListeners();
  }

  void genderOnsaved(String input) {
    if (input == 'male') {
      _isMale = true; // this is a male
    } else {
      _isMale = false; // this is a female
    }
  }

  String isMaleValidator(String input) {
    if (input == null) {
      return 'Select male or female';
    } else {
      return null;
    }
  }

// submit the form in
  void submitOne() async {
    if (_formKeyOne.currentState.validate()) {
      _formKeyOne.currentState.save();

      await _myDatabase.updateIndividuals(editPositionOnRegisteredlist.copyWith(
          isMale: _isMale, registration: _dateTime));

      _updatedValueFromList = await _myDatabase
          .getSingleIndividual(editPositionOnRegisteredlist.id);

      _navigationService.navigateTo(Routes.addFileView,
          arguments: AddFileViewArguments(
              individualTransfer: _updatedValueFromList.single));
    }
  }

  void submitTwo() async {
    if (_formKeyTwo.currentState.validate()) {
      _formKeyTwo.currentState.save();

      await _myDatabase.updateIndividuals(editPositionOnRegisteredlist.copyWith(
          name: _name, registration: _dateTime));

      _updatedValueFromList = await _myDatabase
          .getSingleIndividual(editPositionOnRegisteredlist.id);

      _navigationService.navigateTo(Routes.addFileView,
          arguments: AddFileViewArguments(
              individualTransfer: _updatedValueFromList.single));
    }
  }

  void submitThree() async {
    if (_formKeyThree.currentState.validate()) {
      _formKeyThree.currentState.save();

      await _myDatabase.updateIndividuals(editPositionOnRegisteredlist.copyWith(
          surname: _surname, registration: _dateTime));

      _updatedValueFromList = await _myDatabase
          .getSingleIndividual(editPositionOnRegisteredlist.id);

      _navigationService.navigateTo(Routes.addFileView,
          arguments: AddFileViewArguments(
              individualTransfer: _updatedValueFromList.single));
    }
  }
}
