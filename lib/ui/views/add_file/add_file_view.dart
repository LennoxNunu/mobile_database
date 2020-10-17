import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:mobile_database/ui/views/add_file/addfile_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class AddFileView extends StatelessWidget {
  final Individual individualTransfer;

  const AddFileView(this.individualTransfer);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddFileViewModel>.nonReactive(
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
                          height: 40.0,
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text(this.individualTransfer.id.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(this.individualTransfer.name),
                                    Text('   '),
                                    Text(this.individualTransfer.surname)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    this.individualTransfer.isMale == true
                                        ? 'male'
                                        : 'female'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(this
                                    .individualTransfer
                                    .registration
                                    .toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text('Click to edit profile'),
                                  onPressed: () {
                                    return model.editprofile();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Card(
                          color: Colors.lightGreenAccent,
                          child: FlatButton(
                              color: Colors.lightGreenAccent,
                              onPressed: () => model.openFiles(),
                              child: Text('Click to see old files')),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        _HookForm(this.individualTransfer.id)
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _HookForm extends HookViewModelWidget<AddFileViewModel> {
  final int idNumber;

  _HookForm(this.idNumber);

  @override
  Widget buildViewModelWidget(BuildContext context, AddFileViewModel model) {
    model.individualsId(this.idNumber);
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
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  'Enter new patient file below',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diagnosis'),
                  controller: _diagnosisController,
                  onSaved: (input) => model.diagnosisOnsaved(input),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Treatment'),
                  controller: _treatmentController,
                  onSaved: (input) => model.treatmentOnsaved(input),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Blood Pressure'),
                  controller: _bloodPressureController,
                  onSaved: (input) => model.bloodPressureOnsaved(input),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Pulse'),
                  controller: _pulseController,
                  validator: (input) => model.pulseValidator(input),
                  onSaved: (input) => model.pulseOnsaved(input),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Body Temperature'),
                  controller: _bodyTemperatureController,
                  validator: (input) => model.bodyTemperatureValidator(input),
                  onSaved: (input) => model.bodyTemperatureOnsaved(input),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Respiration Rate'),
                  controller: _respirationRateController,
                  validator: (input) => model.respirationRateValidator(input),
                  onSaved: (input) => model.respirationRateOnsaved(input),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Weight'),
                  controller: _weightController,
                  validator: (input) => model.weightValidator(input),
                  onSaved: (input) => model.weightOnsaved(input),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: RaisedButton(
                        onPressed: () {
                          model.submit();
                          _diagnosisController.clear();
                          _treatmentController.clear();
                          _pulseController.clear();
                          _bloodPressureController.clear();
                          _bodyTemperatureController.clear();
                          _respirationRateController.clear();
                          _weightController.clear();
                        },
                        child: Text('Submit'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                FlatButton(
                  onPressed: () => model.home(),
                  child: Text('Click here to return to home sreen'),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
