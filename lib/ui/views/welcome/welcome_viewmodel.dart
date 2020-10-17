import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  ///navigate to Register_Info_View
  Future<dynamic> newPatient() {
    return _navigationService.navigateTo(Routes.registerInfoView);

    // return _navigationService.navigateTo(Routes.fileListView);
  }

  ///navigate to Registered_List_View
  Future<dynamic> oldPatient() {
    return _navigationService.navigateTo(Routes.registeredListView);
  }
}
