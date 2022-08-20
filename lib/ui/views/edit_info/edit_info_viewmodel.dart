import 'package:flutter/material.dart';
import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/services/db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditInfoViewModel extends BaseViewModel {
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final _formKeyThree = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();
  late Individual editPositionOnRegisteredlist;
  List<Individual> _updatedValueFromList = <Individual>[];

  late String _name;
  late String _surname;
  late bool _isMale;
  final _dateTime = DateTime.now();
  String? myActivity;

  get formKeyOne => _formKeyOne;
  get formKeyTwo => _formKeyTwo;
  get formKeyThree => _formKeyThree;

  void editPost(
      {required int id,
      required bool isMale,
      required String name,
      required DateTime registration,
      required String surname}) {
    Individual editPost = Individual(
      id: id,
      isMale: isMale,
      name: name,
      registration: registration,
      surname: surname,
    );

    editPositionOnRegisteredlist = editPost;
    notifyListeners();
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
  void submitOne() async {
    if (_formKeyOne.currentState!.validate()) {
      _formKeyOne.currentState!.save();

      await _myDatabase.updateIndividuals(editPositionOnRegisteredlist.copyWith(
          isMale: _isMale, registration: _dateTime));

      _updatedValueFromList = await _myDatabase
          .getSingleIndividual(editPositionOnRegisteredlist.id);

      Person individualTransfer = Person(
        id: _updatedValueFromList.single.id,
        isMale: _updatedValueFromList.single.isMale,
        name: _updatedValueFromList.single.name,
        registration: _updatedValueFromList.single.registration,
        surname: _updatedValueFromList.single.surname,
      );

      _navigationService.navigateTo(Routes.addFileView,
          arguments:
              AddFileViewArguments(individualTransfer: individualTransfer));
    }
  }

  void submitTwo() async {
    if (_formKeyTwo.currentState!.validate()) {
      _formKeyTwo.currentState!.save();

      await _myDatabase.updateIndividuals(editPositionOnRegisteredlist.copyWith(
          name: _name, registration: _dateTime));

      _updatedValueFromList = await _myDatabase
          .getSingleIndividual(editPositionOnRegisteredlist.id);

      Person individualTransfer = Person(
        id: _updatedValueFromList.single.id,
        isMale: _updatedValueFromList.single.isMale,
        name: _updatedValueFromList.single.name,
        registration: _updatedValueFromList.single.registration,
        surname: _updatedValueFromList.single.surname,
      );

      _navigationService.navigateTo(Routes.addFileView,
          arguments:
              AddFileViewArguments(individualTransfer: individualTransfer));
    }
  }

  void submitThree() async {
    if (_formKeyThree.currentState!.validate()) {
      _formKeyThree.currentState!.save();

      await _myDatabase.updateIndividuals(editPositionOnRegisteredlist.copyWith(
          isMale: _isMale,
          name: _name,
          surname: _surname,
          registration: _dateTime));

      _updatedValueFromList = await _myDatabase
          .getSingleIndividual(editPositionOnRegisteredlist.id);

      Person individualTransfer = Person(
        id: _updatedValueFromList.single.id,
        isMale: _updatedValueFromList.single.isMale,
        name: _updatedValueFromList.single.name,
        registration: _updatedValueFromList.single.registration,
        surname: _updatedValueFromList.single.surname,
      );

      _navigationService.navigateTo(Routes.addFileView,
          arguments:
              AddFileViewArguments(individualTransfer: individualTransfer));
    }
  }
}
