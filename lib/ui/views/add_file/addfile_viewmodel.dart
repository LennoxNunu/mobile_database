import 'package:flutter/material.dart';
import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/models/person_record.dart';
import 'package:mobile_database/services/db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddFileViewModel extends BaseViewModel {
  late Person positionOnRegisteredlist;
  final _formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();

  late int _individualsId;
  late String _diagnosis;
  final _appointment = DateTime.now();
  late String _treatment;
  late String _bloodPressure;
  late int _pulse;
  late int _respirationRate;
  late int _bodyTemperature;
  late int _weight;

  get formKey => _formKey;

  void individualsId(int idNumber) {
    _individualsId = idNumber;
  }

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

// navigate to Edit_Info_View
  void editprofile() {
    _navigationService.navigateTo(Routes.editInfoView,
        arguments: EditInfoViewArguments(
            positionOnRegisteredlist: positionOnRegisteredlist));
  }

// submit the form in
  void submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      PersonRecord individualsDetail = PersonRecord(
        individualsId: _individualsId,
        appointment: _appointment,
        diagnosis: _diagnosis,
        treatment: _treatment,
        pulse: _pulse,
        bloodPressure: _bloodPressure,
        respirationRate: _respirationRate,
        bodyTemperature: _bodyTemperature,
        weight: _weight,
      );

      await _myDatabase.insertIndividualsDetails(entry: individualsDetail);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredlist,
            individualsId: _individualsId,
          ));
    }
  }

  void openFiles() {
    _navigationService.navigateTo(Routes.fileListView,
        arguments: FileListViewArguments(
          individualTransfer: positionOnRegisteredlist,
          individualsId: positionOnRegisteredlist.id,
        ));
  }

  ///navigate back to Welcome_View
  void home() {
    _navigationService.navigateTo(Routes.welcomeView);
  }
}
