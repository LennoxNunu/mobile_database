import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/services/db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FileListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  late String selectedResult; // Used in the Search class

  List<IndividualsDetail> fileList = <IndividualsDetail>[];
  final _myDatabase = locator<MyDatabase>();

  void getfileList(int individualsId) async {
    fileList = await _myDatabase.getAllIndividualsDetails(individualsId);

    notifyListeners();
  }

// navigate to add_file_view
  void goAddAnotherRecord(Person individualTransfer) {
    _navigationService.navigateTo(Routes.addFileView,
        arguments:
            AddFileViewArguments(individualTransfer: individualTransfer));
  }

// navigate to edit_file_view
  void editfile(
      IndividualsDetail positionOnFilelist, Person individualTransfer) {
    _navigationService.navigateTo(Routes.editFileView,
        arguments: EditFileViewArguments(
          positionOnRegisteredList: individualTransfer,
          positionOnFilelist: positionOnFilelist,
        ));
  }

  Future deleteFile(IndividualsDetail individualsdetail) async {
    await _myDatabase.deleteIndividualsDetails(individualsdetail);
  }
}
