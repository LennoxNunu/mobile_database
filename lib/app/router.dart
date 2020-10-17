import 'package:auto_route/auto_route_annotations.dart';
import 'package:mobile_database/ui/views/add_file/add_file_view.dart';
import 'package:mobile_database/ui/views/edit_file/edit_file_view.dart';
import 'package:mobile_database/ui/views/edit_info/edit_info_view.dart';
import 'package:mobile_database/ui/views/file_list/file_list_view.dart';
import 'package:mobile_database/ui/views/register_info/register_info_view.dart';
import 'package:mobile_database/ui/views/registered_list/registered_list_view.dart';
import 'package:mobile_database/ui/views/welcome/welcome_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: WelcomeView, initial: true),
  MaterialRoute(page: RegisterInfoView),
  MaterialRoute(page: RegisteredListView),
  MaterialRoute(page: AddFileView),
  MaterialRoute(page: FileListView),
  MaterialRoute(page: EditInfoView),
  MaterialRoute(page: EditFileView),
])
class $Router {}
