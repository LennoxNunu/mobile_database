import 'package:flutter/material.dart';
import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/services/db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditFileViewModel extends BaseViewModel {
  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final _formKeyThree = GlobalKey<FormState>();
  final _formKeyFour = GlobalKey<FormState>();
  final _formKeyFive = GlobalKey<FormState>();
  final _formKeySix = GlobalKey<FormState>();
  final _formKeySeven = GlobalKey<FormState>();

  final _navigationService = locator<NavigationService>();
  late Person positionOnRegisteredList;
  final _myDatabase = locator<MyDatabase>();

  late IndividualsDetail editPositionOnFileList;

  late String _diagnosis;
  final _appointment = DateTime.now();
  late String _treatment;
  late String _bloodPressure;
  late int _pulse;
  late int _respirationRate;
  late int _bodyTemperature;
  late int _weight;

  get formKeyOne => _formKeyOne;
  get formKeyTwo => _formKeyTwo;
  get formKeyThree => _formKeyThree;
  get formKeyFour => _formKeyFour;
  get formKeyFive => _formKeyFive;
  get formKeySix => _formKeySix;
  get formKeySeven => _formKeySeven;

  void diagnosisOnsaved(String input) {
    _diagnosis = input;
  }

  void treatmentOnsaved(String input) {
    _treatment = input;
  }

  void bloodPressureOnsaved(String input) {
    _bloodPressure = input;
  }

  String? pulseValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void pulseOnsaved(String input) {
    _pulse = int.tryParse(input)!;
  }

  String? respirationRateValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void respirationRateOnsaved(String input) {
    _respirationRate = int.tryParse(input)!;
  }

  String? bodyTemperatureValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void bodyTemperatureOnsaved(String input) {
    _bodyTemperature = int.tryParse(input)!;
  }

  String? weightValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void weightOnsaved(String input) {
    _weight = int.tryParse(input)!;
  }

// submit the form in
  void submitOne() async {
    if (_formKeyOne.currentState!.validate()) {
      _formKeyOne.currentState!.save();

      await _myDatabase.updateIndividualsDetails(
          editPositionOnFileList.copyWith(
              idPrimary: editPositionOnFileList.idPrimary,
              individualsId: editPositionOnFileList.individualsId,
              appointment: _appointment,
              diagnosis: _diagnosis));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }

  void submitTwo() async {
    if (_formKeyTwo.currentState!.validate()) {
      _formKeyTwo.currentState!.save();

      await _myDatabase
          .updateIndividualsDetails(editPositionOnFileList.copyWith(
        idPrimary: editPositionOnFileList.idPrimary,
        individualsId: editPositionOnFileList.individualsId,
        appointment: _appointment,
        treatment: _treatment,
      ));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }

  void submitThree() async {
    if (_formKeyThree.currentState!.validate()) {
      _formKeyThree.currentState!.save();

      await _myDatabase.updateIndividualsDetails(
          editPositionOnFileList.copyWith(
              idPrimary: editPositionOnFileList.idPrimary,
              individualsId: editPositionOnFileList.individualsId,
              appointment: _appointment,
              pulse: _pulse));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }

  void submitFour() async {
    if (_formKeyFour.currentState!.validate()) {
      _formKeyFour.currentState!.save();

      await _myDatabase.updateIndividualsDetails(
          editPositionOnFileList.copyWith(
              idPrimary: editPositionOnFileList.idPrimary,
              individualsId: editPositionOnFileList.individualsId,
              appointment: _appointment,
              bloodPressure: _bloodPressure));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }

  void submitFive() async {
    if (_formKeyFive.currentState!.validate()) {
      _formKeyFive.currentState!.save();

      await _myDatabase.updateIndividualsDetails(
          editPositionOnFileList.copyWith(
              idPrimary: editPositionOnFileList.idPrimary,
              individualsId: editPositionOnFileList.individualsId,
              appointment: _appointment,
              bodyTemperature: _bodyTemperature));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }

  void submitSix() async {
    if (_formKeySix.currentState!.validate()) {
      _formKeySix.currentState!.save();

      await _myDatabase.updateIndividualsDetails(
          editPositionOnFileList.copyWith(
              idPrimary: editPositionOnFileList.idPrimary,
              individualsId: editPositionOnFileList.individualsId,
              appointment: _appointment,
              respirationRate: _respirationRate));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }

  void submitSeven() async {
    if (_formKeySeven.currentState!.validate()) {
      _formKeySeven.currentState!.save();

      await _myDatabase.updateIndividualsDetails(
          editPositionOnFileList.copyWith(
              idPrimary: editPositionOnFileList.idPrimary,
              individualsId: editPositionOnFileList.individualsId,
              appointment: _appointment,
              weight: _weight));

      await _myDatabase
          .getSingleIndividualsDetail(editPositionOnFileList.idPrimary);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredList,
            individualsId: positionOnRegisteredList.id,
          ));
    }
  }
}
