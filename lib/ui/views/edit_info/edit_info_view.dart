// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/constants/size_config.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/packages/dropdown_formfield/dropdown_formfield.dart';

import 'package:mobile_database/ui/views/edit_info/edit_info_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class EditInfoView extends StatelessWidget {
  final Person positionOnRegisteredlist;
  // ignore: use_key_in_widget_constructors
  const EditInfoView(this.positionOnRegisteredlist);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ViewModelBuilder<EditInfoViewModel>.reactive(
          builder: (context, model, child) {
            model.editPost(
              id: positionOnRegisteredlist.id,
              isMale: positionOnRegisteredlist.isMale,
              name: positionOnRegisteredlist.name,
              registration: positionOnRegisteredlist.registration,
              surname: positionOnRegisteredlist.surname,
            );

            return Scaffold(
                backgroundColor: Colors.lightGreen,
                appBar: AppBar(
                  title: const Text('Edit Profile'),
                ),
                body: Center(
                  child: ListView(
                    children: <Widget>[
                      HookForm(constraints, orientation),
                    ],
                  ),
                ));
          },
          viewModelBuilder: () => EditInfoViewModel(),
        );
      });
    });
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class HookForm extends HookViewModelWidget<EditInfoViewModel> {
  final BoxConstraints constraints;
  final Orientation orientation;
  // ignore: use_key_in_widget_constructors
  const HookForm(this.constraints, this.orientation);

  @override
  Widget buildViewModelWidget(
      BuildContext context, EditInfoViewModel viewModel) {
    var _nameController = useTextEditingController();
    var _surnameController = useTextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
            child: Padding(
          padding: EdgeInsets.all(
              3 * SizeConfig(constraints, orientation).widthMultiplierr()),
          child: Column(
            children: <Widget>[
              Form(
                key: viewModel.formKeyOne,
                child: Row(
                  children: [
                    Flexible(
                      child: DropDownFormField(
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
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Name'),
                        controller: _nameController,
                        validator: (input) => viewModel.nameValidator(input!),
                        onSaved: (input) => viewModel.nameOnsaved(input!),
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
                key: viewModel.formKeyThree,
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Surname'),
                        controller: _surnameController,
                        validator: (input) =>
                            viewModel.surnameValidator(input!),
                        onSaved: (input) => viewModel.surnameOnsaved(input!),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.submitThree(),
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
