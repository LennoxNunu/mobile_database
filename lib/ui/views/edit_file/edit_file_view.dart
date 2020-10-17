import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:mobile_database/ui/views/edit_file/edit_file_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class EditFileView extends StatelessWidget {
  final IndividualsDetail positionOnFilelist;
  final Individual positionOnRegisteredList;
  EditFileView(this.positionOnFilelist, this.positionOnRegisteredList);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditFileViewModel>.nonReactive(
      builder: (context, model, child) {
        model.positionOnRegisteredList = positionOnRegisteredList;
        model.editPositionOnFileList = positionOnFilelist;
        return Scaffold(
            backgroundColor: Colors.lightGreen,
            appBar: AppBar(
              title: Text('Edit File'),
            ),
            body: Center(
              child: ListView(
                children: <Widget>[
                  _HookForm(),
                ],
              ),
            ));
      },
      viewModelBuilder: () => EditFileViewModel(),
    );
  }
}

class _HookForm extends HookViewModelWidget<EditFileViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, EditFileViewModel model) {
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 4.0),
              Form(
                key: model.formKeyOne,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Diagnosis'),
                        controller: _diagnosisController,
                        onSaved: (input) => model.diagnosisOnsaved(input),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitOne(),
                      child: Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: model.formKeyTwo,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Treatment'),
                        controller: _treatmentController,
                        onSaved: (input) => model.treatmentOnsaved(input),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitTwo(),
                      child: Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: model.formKeyFour,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Blood Pressure'),
                        controller: _bloodPressureController,
                        onSaved: (input) => model.bloodPressureOnsaved(input),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitFour(),
                      child: Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: model.formKeyThree,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Pulse'),
                        controller: _pulseController,
                        validator: (input) => model.pulseValidator(input),
                        onSaved: (input) => model.pulseOnsaved(input),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitThree(),
                      child: Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: model.formKeyFive,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Body Temperature'),
                        controller: _bodyTemperatureController,
                        validator: (input) =>
                            model.bodyTemperatureValidator(input),
                        onSaved: (input) => model.bodyTemperatureOnsaved(input),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitFive(),
                      child: Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: model.formKeySix,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Respiration Rate'),
                        controller: _respirationRateController,
                        validator: (input) =>
                            model.respirationRateValidator(input),
                        onSaved: (input) => model.respirationRateOnsaved(input),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitSix(),
                      child: Text('Save and exit'),
                    )
                  ],
                ),
              ),
              Form(
                key: model.formKeySeven,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Weight'),
                        controller: _weightController,
                        validator: (input) => model.weightValidator(input),
                        onSaved: (input) => model.weightOnsaved(input),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitSeven(),
                      child: Text('Save and exit'),
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
