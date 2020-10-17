import 'package:flutter/material.dart';
import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterInfoViewModel extends BaseViewModel {
  final _formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();

  int _id;
  String _name;
  String _surname;
  bool _isMale;
  var _dateTime = DateTime.now();
  String myActivity;

  get formKey => _formKey;

  String idValidator(String input) {
    if (int.tryParse(input) == null) {
      return 'please use numbers only';
    } else {
      return input.length < 5 ? 'ID/Passport number required' : null;
    }
  }

  void idOnsaved(String input) {
    _id = int.tryParse(input);
  }

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
  void submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Individual individual = Individual(
        id: _id,
        name: _name,
        surname: _surname,
        isMale: _isMale,
        registration: _dateTime,
      );

      await _myDatabase.insertIndividuals(individual);

      _navigationService.navigateTo(Routes.addFileView,
          arguments: AddFileViewArguments(individualTransfer: individual));
    }
  }

  ///navigate back to Welcome_View
  Future<dynamic> home() {
    return _navigationService.navigateTo(Routes.welcomeView);
  }
}
