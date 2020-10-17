import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:mobile_database/services/database/moor_database.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisteredListViewModel extends StreamViewModel {
  String selectedResult; // Used in the Search class
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();

  // collects the list from database
  List<Individual> get registeredList =>
      data; // data returns all the data from stream

//This list is used for searching a given id number
  List<String> list() {
    return registeredList.map((e) => e.id.toString()).toList();
  }

// This is the stream that creates the data
  @override
  Stream get stream => _myDatabase.watchAllIndividuals();

  addFile(Individual individualTransfer) {
    print(individualTransfer.id);

    _navigationService.navigateTo(Routes.addFileView,
        arguments:
            AddFileViewArguments(individualTransfer: individualTransfer));
  }
}

class SearchResultModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int _individualsId;
  Individual _individualTransfer;
  final _myDatabase = locator<MyDatabase>();
  List<Individual> selectedSearchValueFromList = List<Individual>();

  fileListViewArguments(
      int individualsId, String passOnName, Individual individualTransfer) {
    _individualsId = individualsId;
    _individualTransfer = individualTransfer;
  }

  void indentifiedSearch(String selectedId) async {
    int searchId = int.tryParse(selectedId);
    selectedSearchValueFromList =
        await _myDatabase.getSingleIndividual(searchId);
    notifyListeners();
  }

  Future<dynamic> fileList() {
    return _navigationService.navigateTo(Routes.fileListView,
        arguments: FileListViewArguments(
          individualTransfer: _individualTransfer,
          individualsId: _individualsId,
        ));
  }
}
