import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:mobile_database/services/database/moor_database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FileListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String selectedResult; // Used in the Search class

  List<IndividualsDetail> fileList = List<IndividualsDetail>();
  final _myDatabase = locator<MyDatabase>();

  void getfileList(int individualsId) async {
    fileList = await _myDatabase.getAllIndividualsDetails(individualsId);

    notifyListeners();
  }

// navigate to add_file_view
  dynamic goAddAnotherRecord(Individual individualTransfer) {
    _navigationService.navigateTo(Routes.addFileView,
        arguments:
            AddFileViewArguments(individualTransfer: individualTransfer));
  }

// navigate to edit_file_view
  dynamic editfile(
      IndividualsDetail positionOnFilelist, Individual individualTransfer) {
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
