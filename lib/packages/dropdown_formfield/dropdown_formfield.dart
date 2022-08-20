// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;

  DropDownFormField(
      {required FormFieldSetter<dynamic> onSaved,
      required FormFieldValidator<dynamic> validator,
      AutovalidateMode autovalidate = AutovalidateMode.disabled,
      this.titleText = 'Title',
      this.hintText = 'Select one option',
      this.required = false,
      this.errorText = 'Please select one option',
      this.value,
      required this.dataSource,
      required this.textField,
      required this.valueField,
      required this.onChanged,
      this.filled = true,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: contentPadding,
                    labelText: titleText,
                    filled: filled,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<dynamic>(
                      isExpanded: true,
                      hint: Text(
                        hintText,
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      value: value == '' ? null : value,
                      onChanged: (dynamic newValue) {
                        state.didChange(newValue);
                        onChanged(newValue);
                      },
                      items: dataSource.map((item) {
                        return DropdownMenuItem<dynamic>(
                          value: item[valueField],
                          child: Text(item[textField],
                              overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: state.hasError ? 5.0 : 0.0),
                Text(
                  'FormField error',
                  style: TextStyle(
                      color: Colors.redAccent.shade700,
                      fontSize: state.hasError ? 12.0 : 0.0),
                ),
              ],
            );
          },
        );
}
