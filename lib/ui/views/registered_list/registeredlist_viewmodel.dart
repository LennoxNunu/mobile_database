import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/services/db.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisteredListViewModel extends StreamViewModel {
  String selectedResult = ''; // Used in the Search class
  final _navigationService = locator<NavigationService>();
  final _myDatabase = locator<MyDatabase>();

  // collects the list from database
  List<Individual> get registeredList {
    List<Individual> result;
    if (data == null) {
      result = <Individual>[];
    } else {
      result = data;
    }
    return result;
  } // data returns all the data from stream

//This list is used for searching a given id number
  List<String> list() {
    return registeredList.map((e) => e.id.toString()).toList();
  }

// This is the stream that creates the data
  @override
  Stream get stream => _myDatabase.watchAllIndividuals();

  addFile(Individual individualTransfer) {
    Person person = Person(
        id: individualTransfer.id,
        isMale: individualTransfer.isMale,
        name: individualTransfer.name,
        registration: individualTransfer.registration,
        surname: individualTransfer.surname);

    _navigationService.navigateTo(Routes.addFileView,
        arguments: AddFileViewArguments(individualTransfer: person));
  }
}

class SearchResultModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  late int _individualsId;
  late Person _individualTransfer;
  final _myDatabase = locator<MyDatabase>();
  List<Individual> selectedSearchValueFromList = <Individual>[];

  void fileListViewArguments(
      int individualsId, String passOnName, Person individualTransfer) {
    _individualsId = individualsId;
    _individualTransfer = individualTransfer;
  }

  void indentifiedSearch(String selectedId) async {
    int searchId = int.parse(selectedId);
    selectedSearchValueFromList =
        await _myDatabase.getSingleIndividual(searchId);
    notifyListeners();
  }

  void fileList() {
    _navigationService.navigateTo(Routes.fileListView,
        arguments: FileListViewArguments(
          individualTransfer: _individualTransfer,
          individualsId: _individualsId,
        ));
  }
}
