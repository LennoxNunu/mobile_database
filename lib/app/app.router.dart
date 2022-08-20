// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/person.dart';
import '../services/db.dart';
import '../ui/views/add_file/add_file_view.dart';
import '../ui/views/edit_file/edit_file_view.dart';
import '../ui/views/edit_info/edit_info_view.dart';
import '../ui/views/file_list/file_list_view.dart';
import '../ui/views/register_info/register_info_view.dart';
import '../ui/views/registered_list/registered_list_view.dart';
import '../ui/views/welcome/welcome_view.dart';

class Routes {
  static const String welcomeView = '/';
  static const String registerInfoView = '/register-info-view';
  static const String registeredListView = '/registered-list-view';
  static const String addFileView = '/add-file-view';
  static const String fileListView = '/file-list-view';
  static const String editInfoView = '/edit-info-view';
  static const String editFileView = '/edit-file-view';
  static const all = <String>{
    welcomeView,
    registerInfoView,
    registeredListView,
    addFileView,
    fileListView,
    editInfoView,
    editFileView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.registerInfoView, page: RegisterInfoView),
    RouteDef(Routes.registeredListView, page: RegisteredListView),
    RouteDef(Routes.addFileView, page: AddFileView),
    RouteDef(Routes.fileListView, page: FileListView),
    RouteDef(Routes.editInfoView, page: EditInfoView),
    RouteDef(Routes.editFileView, page: EditFileView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    RegisterInfoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterInfoView(),
        settings: data,
      );
    },
    RegisteredListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisteredListView(),
        settings: data,
      );
    },
    AddFileView: (data) {
      var args = data.getArgs<AddFileViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddFileView(args.individualTransfer),
        settings: data,
      );
    },
    FileListView: (data) {
      var args = data.getArgs<FileListViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => FileListView(
          args.individualsId,
          args.individualTransfer,
        ),
        settings: data,
      );
    },
    EditInfoView: (data) {
      var args = data.getArgs<EditInfoViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditInfoView(args.positionOnRegisteredlist),
        settings: data,
      );
    },
    EditFileView: (data) {
      var args = data.getArgs<EditFileViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditFileView(
          args.positionOnFilelist,
          args.positionOnRegisteredList,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddFileView arguments holder class
class AddFileViewArguments {
  final Person individualTransfer;
  AddFileViewArguments({required this.individualTransfer});
}

/// FileListView arguments holder class
class FileListViewArguments {
  final int individualsId;
  final Person individualTransfer;
  FileListViewArguments(
      {required this.individualsId, required this.individualTransfer});
}

/// EditInfoView arguments holder class
class EditInfoViewArguments {
  final Person positionOnRegisteredlist;
  EditInfoViewArguments({required this.positionOnRegisteredlist});
}

/// EditFileView arguments holder class
class EditFileViewArguments {
  final IndividualsDetail positionOnFilelist;
  final Person positionOnRegisteredList;
  EditFileViewArguments(
      {required this.positionOnFilelist,
      required this.positionOnRegisteredList});
}
