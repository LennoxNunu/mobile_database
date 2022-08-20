import 'package:flutter/material.dart';
import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/services/db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterInfoViewModel extends BaseViewModel {
  final _formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();

  late int _id;
  late String _name;
  late String _surname;
  late bool _isMale;
  final _dateTime = DateTime.now();
  String? myActivity;

  get formKey => _formKey;

  String? idValidator(String input) {
    if (int.tryParse(input) == null) {
      return 'please use numbers only';
    } else {
      return input.length < 5 ? 'ID/Passport number required' : null;
    }
  }

  void idOnsaved(String input) {
    _id = int.tryParse(input)!;
  }

  String? nameValidator(String input) {
    return input.length < 2 ? 'Name required' : null;
  }

  void nameOnsaved(String input) {
    _name = input;
  }

  String? surnameValidator(String input) {
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

  String? isMaleValidator(String input) {
    // ignore: unnecessary_null_comparison
    if (input == null) {
      return 'Select male or female';
    } else {
      return null;
    }
  }

// submit the form in
  void submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Person individual = Person(
        id: _id,
        name: _name,
        surname: _surname,
        isMale: _isMale,
        registration: _dateTime,
      );

      await _myDatabase.insertIndividuals(entry: individual);

      _navigationService.navigateTo(Routes.addFileView,
          arguments: AddFileViewArguments(individualTransfer: individual));
    }
  }

  ///navigate back to Welcome_View
  void home() {
    _navigationService.navigateTo(Routes.welcomeView);
  }
}
