import 'package:flutter/material.dart';
import 'package:mobile_database/constants/size_config.dart';

import 'package:mobile_database/models/person.dart';

import 'package:mobile_database/ui/views/file_list/file_list_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FileListView extends StatelessWidget {
  final int _individualsId;

  final Person _individualTransfer;
  // ignore: use_key_in_widget_constructors
  const FileListView(this._individualsId, this._individualTransfer);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ViewModelBuilder<FileListViewModel>.reactive(
            viewModelBuilder: () => FileListViewModel(),
            builder: (context, model, _) {
              model.getfileList(_individualsId);
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Scaffold(
                  backgroundColor: Colors.lightGreen,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Center(child: Text(_individualTransfer.name)),
                  ),
                  body: model.fileList.isEmpty
                      ? const Center(
                          child: Card(
                            child: Text(
                              "This patient was never attended to, you may proceed to adding the patient's first record",
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: model.fileList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Slidable(
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      model.editfile(model.fileList[index],
                                          _individualTransfer);
                                    },
                                    foregroundColor: Colors.blue,
                                    icon: Icons.edit,
                                    label: 'Edit File',
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      model.deleteFile(model.fileList[index]);
                                    },
                                    foregroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 4 *
                                        SizeConfig(constraints, orientation)
                                            .heightMultiplierr(),
                                    vertical: 3 *
                                        SizeConfig(constraints, orientation)
                                            .widthMultiplierr()),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    if (true)
                                      Padding(
                                        padding: EdgeInsets.all(4.5 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Date and Time  :  ${model.fileList[index].appointment.toString()}'),
                                      ),
                                    if (model.fileList[index].diagnosis
                                        .toString()
                                        .isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.all(6 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Daignosis :  ${model.fileList[index].diagnosis}'),
                                      ),
                                    if (model.fileList[index].treatment
                                        .toString()
                                        .isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.all(6 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Treatment  : ${model.fileList[index].treatment}'),
                                      ),
                                    if (model.fileList[index].bloodPressure
                                        .toString()
                                        .isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.all(3 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Blood Pressure  :  ${model.fileList[index].bloodPressure} millimeters of mercury'),
                                      ),

                                    if (model.fileList[index].pulse != null)
                                      Padding(
                                        padding: EdgeInsets.all(3 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Pulse:  ${model.fileList[index].pulse} beats per minute'),
                                      ),

                                    if (model.fileList[index].bodyTemperature !=
                                        null)
                                      Padding(
                                        padding: EdgeInsets.all(3 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Body Temperature  :  ${model.fileList[index].bodyTemperature.toString()} degree celsius'),
                                      ),
                                    if (model.fileList[index].respirationRate !=
                                        null)
                                      Padding(
                                        padding: EdgeInsets.all(3 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Respiration  :  ${model.fileList[index].respirationRate.toString()} breaths per minute'),
                                      ),
                                    if (model.fileList[index].weight != null)
                                      Padding(
                                        padding: EdgeInsets.all(3 *
                                            SizeConfig(constraints, orientation)
                                                .widthMultiplierr()),
                                        child: Text(
                                            'Weight  :  ${model.fileList[index].weight.toString()} kilograms'),
                                      ),

                                    // man == null ? Text('Man is null') : null,
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () =>
                        model.goAddAnotherRecord(_individualTransfer),
//tooltip: 'Increment',
                    child: Row(children: const <Widget>[
                      Icon(Icons.arrow_back),
                      Icon(Icons.add)
                    ]),
                  ),
                ),
              );
            });
      });
    });
  }
}
