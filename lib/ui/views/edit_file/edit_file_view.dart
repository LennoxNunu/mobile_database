// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/constants/size_config.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/services/db.dart';
import 'package:mobile_database/ui/views/edit_file/edit_file_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class EditFileView extends StatelessWidget {
  final IndividualsDetail positionOnFilelist;
  final Person positionOnRegisteredList;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  EditFileView(this.positionOnFilelist, this.positionOnRegisteredList);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ViewModelBuilder<EditFileViewModel>.reactive(
          builder: (context, model, child) {
            model.positionOnRegisteredList = positionOnRegisteredList;
            model.editPositionOnFileList = positionOnFilelist;
            return Scaffold(
                backgroundColor: Colors.lightGreen,
                appBar: AppBar(
                  title: const Text('Edit File'),
                ),
                body: Center(
                  child: ListView(
                    children: <Widget>[
                      HookForm(constraints, orientation),
                    ],
                  ),
                ));
          },
          viewModelBuilder: () => EditFileViewModel(),
        );
      });
    });
  }
}

class HookForm extends HookViewModelWidget<EditFileViewModel> {
  final BoxConstraints constraints;
  final Orientation orientation;
  // ignore: use_key_in_widget_constructors
  const HookForm(this.constraints, this.orientation);

  @override
  Widget buildViewModelWidget(
      BuildContext context, EditFileViewModel viewModel) {
    var _diagnosisController = useTextEditingController();
    var _treatmentController = useTextEditingController();
    var _pulseController = useTextEditingController();
    var _bloodPressureController = useTextEditingController();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                  height: 1 *
                      SizeConfig(constraints, orientation).heightMultiplierr()),
              Form(
                key: viewModel.formKeyOne,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Diagnosis'),
                        controller: _diagnosisController,
                        onSaved: (input) => viewModel.diagnosisOnsaved(input!),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitOne(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: viewModel.formKeyTwo,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Treatment'),
                        controller: _treatmentController,
                        onSaved: (input) => viewModel.treatmentOnsaved(input!),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitTwo(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: viewModel.formKeyFour,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Blood Pressure'),
                        controller: _bloodPressureController,
                        onSaved: (input) =>
                            viewModel.bloodPressureOnsaved(input!),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitFour(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: viewModel.formKeyThree,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Pulse'),
                        controller: _pulseController,
                        validator: (input) => viewModel.pulseValidator(input!),
                        onSaved: (input) => viewModel.pulseOnsaved(input!),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitThree(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: viewModel.formKeyFive,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Body Temperature'),
                        controller: _bodyTemperatureController,
                        validator: (input) =>
                            viewModel.bodyTemperatureValidator(input!),
                        onSaved: (input) =>
                            viewModel.bodyTemperatureOnsaved(input!),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitFive(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: viewModel.formKeySix,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Respiration Rate'),
                        controller: _respirationRateController,
                        validator: (input) =>
                            viewModel.respirationRateValidator(input!),
                        onSaved: (input) =>
                            viewModel.respirationRateOnsaved(input!),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitSix(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: viewModel.formKeySeven,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Weight'),
                        controller: _weightController,
                        validator: (input) => viewModel.weightValidator(input!),
                        onSaved: (input) => viewModel.weightOnsaved(input!),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitSeven(),
                      child: const Text('Save and exit'),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
