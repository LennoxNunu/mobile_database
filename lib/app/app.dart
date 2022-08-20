import 'package:mobile_database/services/db.dart';
import 'package:mobile_database/ui/views/add_file/add_file_view.dart';
import 'package:mobile_database/ui/views/edit_file/edit_file_view.dart';
import 'package:mobile_database/ui/views/edit_info/edit_info_view.dart';
import 'package:mobile_database/ui/views/file_list/file_list_view.dart';
import 'package:mobile_database/ui/views/register_info/register_info_view.dart';
import 'package:mobile_database/ui/views/registered_list/registered_list_view.dart';
import 'package:mobile_database/ui/views/welcome/welcome_view.dart';

import 'package:stacked/stacked_annotations.dart';

import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: WelcomeView, initial: true),
    MaterialRoute(page: RegisterInfoView),
    MaterialRoute(page: RegisteredListView),
    MaterialRoute(page: AddFileView),
    MaterialRoute(page: FileListView),
    MaterialRoute(page: EditInfoView),
    MaterialRoute(page: EditFileView),
  ],
  dependencies: [
    // Singleton(classType: FirebaseAuthentication),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: MyDatabase),

    // LazySingleton(classType: DialogService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
