import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:mobile_database/ui/views/edit_info/edit_info_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class EditInfoView extends StatelessWidget {
  final Individual positionOnRegisteredlist;
  const EditInfoView(this.positionOnRegisteredlist);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditInfoViewModel>.nonReactive(
      builder: (context, model, child) {
        model.editPositionOnRegisteredlist = positionOnRegisteredlist;
        return Scaffold(
            backgroundColor: Colors.lightGreen,
            appBar: AppBar(
              title: Text('Edit Profile'),
            ),
            body: Center(
              child: ListView(
                children: <Widget>[
                  _HookForm(),
                ],
              ),
            ));
      },
      viewModelBuilder: () => EditInfoViewModel(),
    );
  }
}

// Form that makes use of the ViewModel provided above but also makes use of hooks
class _HookForm extends HookViewModelWidget<EditInfoViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, EditInfoViewModel model) {
    var _nameController = useTextEditingController();
    var _surnameController = useTextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Form(
                key: model.formKeyOne,
                child: Row(
                  children: [
                    Flexible(
                      child: DropDownFormField(
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
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Name'),
                        controller: _nameController,
                        validator: (input) => model.nameValidator(input),
                        onSaved: (input) => model.nameOnsaved(input),
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
                key: model.formKeyThree,
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Surname'),
                        controller: _surnameController,
                        validator: (input) => model.surnameValidator(input),
                        onSaved: (input) => model.surnameOnsaved(input),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => model.submitThree(),
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
