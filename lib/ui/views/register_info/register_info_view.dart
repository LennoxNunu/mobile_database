// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/constants/size_config.dart';
import 'package:mobile_database/packages/dropdown_formfield/dropdown_formfield.dart';
import 'package:mobile_database/ui/views/register_info/register_info_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class RegisterInfoView extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  RegisterInfoView();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
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
                      HookForm(constraints, orientation),
                    ],
                  ),
                )),
          ),
          viewModelBuilder: () => RegisterInfoViewModel(),
        );
      });
    });
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class HookForm extends HookViewModelWidget<RegisterInfoViewModel> {
  get value => null;
  final BoxConstraints constraints;
  final Orientation orientation;
  // ignore: use_key_in_widget_constructors
  const HookForm(this.constraints, this.orientation);

  @override
  Widget buildViewModelWidget(
      BuildContext context, RegisterInfoViewModel viewModel) {
    var _idController = useTextEditingController();
    var _nameController = useTextEditingController();
    var _surnameController = useTextEditingController();

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
                  'You are now registering the new patient',
                ),
                SizedBox(
                    height: 2 *
                        SizeConfig(constraints, orientation)
                            .heightMultiplierr()),
                DropDownFormField(
                  validator: (input) => viewModel.isMaleValidator(input),
                  titleText: 'Gender',
                  //hintText: 'Please choose one',
                  value: viewModel.myActivity,
                  onChanged: (input) => viewModel.genderOnChanged(input),
                  onSaved: (input) => viewModel.genderOnsaved(input),
                  dataSource: const [
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
                  decoration: const InputDecoration(labelText: 'ID number'),
                  controller: _idController,
                  validator: (input) => viewModel.idValidator(input!),
                  onSaved: (input) => viewModel.idOnsaved(input!),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  controller: _nameController,
                  validator: (input) => viewModel.nameValidator(input!),
                  onSaved: (input) => viewModel.nameOnsaved(input!),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Surname'),
                  controller: _surnameController,
                  validator: (input) => viewModel.surnameValidator(input!),
                  onSaved: (input) => viewModel.surnameOnsaved(input!),
                  keyboardType: TextInputType.text,
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
                          _idController.clear();
                          _nameController.clear();
                          _surnameController.clear();
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
