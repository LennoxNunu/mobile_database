import 'package:mobile_database/app/app.locator.dart';
import 'package:mobile_database/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  ///navigate to Register_Info_View
  void newPatient() {
    _navigationService.navigateTo(Routes.registerInfoView);

    // return _navigationService.navigateTo(Routes.fileListView);
  }

  ///navigate to Registered_List_View
  void oldPatient() {
    _navigationService.navigateTo(Routes.registeredListView);
  }
}
