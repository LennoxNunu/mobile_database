// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/constants/size_config.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/ui/views/add_file/addfile_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class AddFileView extends StatelessWidget {
  final Person individualTransfer;

  // ignore: use_key_in_widget_constructors
  const AddFileView(this.individualTransfer);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ViewModelBuilder<AddFileViewModel>.reactive(
            viewModelBuilder: () => AddFileViewModel(),
            builder: (context, model, _) {
              model.positionOnRegisteredlist = individualTransfer;

              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Scaffold(
                  backgroundColor: Colors.lightGreen,
                  body: ListView(children: <Widget>[
                    Center(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                                height: 8 *
                                    SizeConfig(constraints, orientation)
                                        .heightMultiplierr()),
                            Card(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(3 *
                                        SizeConfig(constraints, orientation)
                                            .widthMultiplierr()),
                                    child:
                                        Text(individualTransfer.id.toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3 *
                                        SizeConfig(constraints, orientation)
                                            .widthMultiplierr()),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(individualTransfer.name),
                                        const Text('   '),
                                        Text(individualTransfer.surname)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3 *
                                        SizeConfig(constraints, orientation)
                                            .widthMultiplierr()),
                                    child: Text(
                                        individualTransfer.isMale == true
                                            ? 'male'
                                            : 'female'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3 *
                                        SizeConfig(constraints, orientation)
                                            .widthMultiplierr()),
                                    child: Text(individualTransfer.registration
                                        .toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3 *
                                        SizeConfig(constraints, orientation)
                                            .widthMultiplierr()),
                                    child: ElevatedButton(
                                      child:
                                          const Text('Click to edit profile'),
                                      onPressed: () {
                                        model.editprofile();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 4.1 *
                                    SizeConfig(constraints, orientation)
                                        .heightMultiplierr()),
                            Card(
                              color: Colors.lightGreenAccent,
                              child: ElevatedButton(
                                  //color: Colors.lightGreenAccent,
                                  onPressed: () => model.openFiles(),
                                  child: const Text('Click to see old files')),
                            ),
                            SizedBox(
                                height: 4.1 *
                                    SizeConfig(constraints, orientation)
                                        .heightMultiplierr()),
                            HookForm(
                                individualTransfer.id, constraints, orientation)
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            });
      });
    });
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class HookForm extends HookViewModelWidget<AddFileViewModel> {
  final int idNumber;
  final BoxConstraints constraints;
  final Orientation orientation;

  // ignore: use_key_in_widget_constructors
  const HookForm(this.idNumber, this.constraints, this.orientation);

  @override
  Widget buildViewModelWidget(
      BuildContext context, AddFileViewModel viewModel) {
    viewModel.individualsId(idNumber);
    var _diagnosisController = useTextEditingController();
    var _treatmentController = useTextEditingController();
    var _bloodPressureController = useTextEditingController();
    var _pulseController = useTextEditingController();
    var _bodyTemperatureController = useTextEditingController();
    var _respirationRateController = useTextEditingController();
    var _weightController = useTextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
            child: Padding(
          padding: EdgeInsets.all(
              3 * SizeConfig(constraints, orientation).widthMultiplierr()),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                    height: 4 *
                        SizeConfig(constraints, orientation)
                            .heightMultiplierr()),
                const Text(
                  'Enter new patient file below',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Diagnosis'),
                  controller: _diagnosisController,
                  onSaved: (input) => viewModel.diagnosisOnsaved(input!),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Treatment'),
                  controller: _treatmentController,
                  onSaved: (input) => viewModel.treatmentOnsaved(input!),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Blood Pressure'),
                  controller: _bloodPressureController,
                  onSaved: (input) => viewModel.bloodPressureOnsaved(input!),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Pulse'),
                  controller: _pulseController,
                  validator: (input) => viewModel.pulseValidator(input!),
                  onSaved: (input) => viewModel.pulseOnsaved(input!),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Body Temperature'),
                  controller: _bodyTemperatureController,
                  validator: (input) =>
                      viewModel.bodyTemperatureValidator(input!),
                  onSaved: (input) => viewModel.bodyTemperatureOnsaved(input!),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Respiration Rate'),
                  controller: _respirationRateController,
                  validator: (input) =>
                      viewModel.respirationRateValidator(input!),
                  onSaved: (input) => viewModel.respirationRateOnsaved(input!),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Weight'),
                  controller: _weightController,
                  validator: (input) => viewModel.weightValidator(input!),
                  onSaved: (input) => viewModel.weightOnsaved(input!),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(3 *
                          SizeConfig(constraints, orientation)
                              .widthMultiplierr()),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.submit();
                          _diagnosisController.clear();
                          _treatmentController.clear();
                          _pulseController.clear();
                          _bloodPressureController.clear();
                          _bodyTemperatureController.clear();
                          _respirationRateController.clear();
                          _weightController.clear();
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 8 *
                        SizeConfig(constraints, orientation)
                            .heightMultiplierr()),
                ElevatedButton(
                  onPressed: () => viewModel.home(),
                  child: const Text('Click here to return to home sreen'),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
