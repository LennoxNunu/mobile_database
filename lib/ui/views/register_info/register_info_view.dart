import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/ui/views/register_info/register_info_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class RegisterInfoView extends StatelessWidget {
  const RegisterInfoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterInfoViewModel>.nonReactive(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: Colors.lightGreen,
            body: Center(
              child: ListView(
                children: <Widget>[
                  _HookForm(),
                ],
              ),
            )),
      ),
      viewModelBuilder: () => RegisterInfoViewModel(),
    );
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _HookForm extends HookViewModelWidget<RegisterInfoViewModel> {
  get value => null;

  @override
  Widget buildViewModelWidget(
      BuildContext context, RegisterInfoViewModel model) {
    var _idController = useTextEditingController();
    var _nameController = useTextEditingController();
    var _surnameController = useTextEditingController();

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
                  'You are now registering the new patient',
                ),
                SizedBox(height: 10.0),
                DropDownFormField(
                  validator: (input) => model.isMaleValidator(input),
                  titleText: 'Gender',
                  //hintText: 'Please choose one',
                  value: model.myActivity,
                  onChanged: (input) => model.genderOnChanged(input),
                  onSaved: (input) => model.genderOnsaved(input),
                  dataSource: [
                    {
                      "display": "male",
                      "value": "male",
                    },
                    {
                      "display": "female",
                      "value": "female",
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ID number'),
                  controller: _idController,
                  validator: (input) => model.idValidator(input),
                  onSaved: (input) => model.idOnsaved(input),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: _nameController,
                  validator: (input) => model.nameValidator(input),
                  onSaved: (input) => model.nameOnsaved(input),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Surname'),
                  controller: _surnameController,
                  validator: (input) => model.surnameValidator(input),
                  onSaved: (input) => model.surnameOnsaved(input),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: RaisedButton(
                        onPressed: () {
                          model.submit();
                          _idController.clear();
                          _nameController.clear();
                          _surnameController.clear();
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
