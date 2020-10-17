import 'package:flutter/material.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:mobile_database/ui/views/file_list/file_list_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FileListView extends StatelessWidget {
  final int _individualsId;

  final Individual _individualTransfer;
  const FileListView(this._individualsId, this._individualTransfer);

  @override
  Widget build(BuildContext context) {
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
                title: Center(child: Text(this._individualTransfer.name)),
              ),
              body: model.fileList.length == 0
                  ? Center(
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
                          actionPane: SlidableDrawerActionPane(),
                          actions: <Widget>[
                            IconSlideAction(
                                caption: 'Edit File',
                                color: Colors.blue,
                                icon: Icons.edit,
                                onTap: () => model.editfile(
                                    model.fileList[index],
                                    _individualTransfer)),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () =>
                                  model.deleteFile(model.fileList[index]),
                            )
                          ],
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                if (true)
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                        'Date and Time  :  ${model.fileList[index].appointment.toString()}'),
                                  ),
                                if (model.fileList[index].diagnosis
                                        .toString()
                                        .length !=
                                    0)
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                        'Daignosis :  ${model.fileList[index].diagnosis}'),
                                  ),
                                if (model.fileList[index].treatment
                                        .toString()
                                        .length !=
                                    0)
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                        'Treatment  : ${model.fileList[index].treatment}'),
                                  ),
                                if (model.fileList[index].bloodPressure
                                        .toString()
                                        .length !=
                                    0)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Blood Pressure  :  ${model.fileList[index].bloodPressure} millimeters of mercury'),
                                  ),

                                if (model.fileList[index].pulse != null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Pulse:  ${model.fileList[index].pulse} beats per minute'),
                                  ),

                                if (model.fileList[index].bodyTemperature !=
                                    null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Body Temperature  :  ${model.fileList[index].bodyTemperature.toString()} degree celsius'),
                                  ),
                                if (model.fileList[index].respirationRate !=
                                    null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Respiration  :  ${model.fileList[index].respirationRate.toString()} breaths per minute'),
                                  ),
                                if (model.fileList[index].weight != null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                onPressed: () => model.goAddAnotherRecord(_individualTransfer),
//tooltip: 'Increment',
                child: Row(children: <Widget>[
                  Icon(Icons.arrow_back),
                  Icon(Icons.add)
                ]),
              ),
            ),
          );
        });
  }
}
