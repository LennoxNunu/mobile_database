import 'package:flutter/material.dart';
import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddFileViewModel extends BaseViewModel {
  Individual positionOnRegisteredlist;
  final _formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();

  int _individualsId;
  String _diagnosis;
  var _appointment = DateTime.now();
  String _treatment;
  String _bloodPressure;
  int _pulse;
  int _respirationRate;
  int _bodyTemperature;
  int _weight;

  get formKey => _formKey;

  individualsId(int idNumber) {
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

  String pulseValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void pulseOnsaved(String input) {
    _pulse = int.tryParse(input);
  }

  String respirationRateValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void respirationRateOnsaved(String input) {
    _respirationRate = int.tryParse(input);
  }

  String bodyTemperatureValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void bodyTemperatureOnsaved(String input) {
    _bodyTemperature = int.tryParse(input);
  }

  String weightValidator(String input) {
    return input.length > 2 ? 'Enter a two digit number' : null;
  }

  void weightOnsaved(String input) {
    _weight = int.tryParse(input);
  }

// navigate to Edit_Info_View
  editprofile() {
    _navigationService.navigateTo(Routes.editInfoView,
        arguments: EditInfoViewArguments(
            positionOnRegisteredlist: positionOnRegisteredlist));

    print(positionOnRegisteredlist.id);
  }

// submit the form in
  void submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      IndividualsDetail individualsDetail = IndividualsDetail(
        //The idPrimary is auto incrementing key and handled by database.
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

      await _myDatabase.insertIndividualsDetails(individualsDetail);

      _navigationService.navigateTo(Routes.fileListView,
          arguments: FileListViewArguments(
            individualTransfer: positionOnRegisteredlist,
            individualsId: individualsDetail.individualsId,
          ));
    }
  }

  openFiles() {
    _navigationService.navigateTo(Routes.fileListView,
        arguments: FileListViewArguments(
          individualTransfer: positionOnRegisteredlist,
          individualsId: positionOnRegisteredlist.id,
        ));
  }

  ///navigate back to Welcome_View
  Future<dynamic> home() {
    return _navigationService.navigateTo(Routes.welcomeView);
  }
}
