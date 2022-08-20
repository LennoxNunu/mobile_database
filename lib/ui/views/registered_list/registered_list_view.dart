import 'package:flutter/material.dart';
import 'package:mobile_database/constants/size_config.dart';
import 'package:mobile_database/models/person.dart';
import 'package:mobile_database/ui/views/registered_list/registeredlist_viewmodel.dart';
import 'package:stacked/stacked.dart';

// ignore: use_key_in_widget_constructors
class RegisteredListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ViewModelBuilder<RegisteredListViewModel>.reactive(
            viewModelBuilder: () => RegisteredListViewModel(),
            builder: (context, model, _) => Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: Search(constraints, orientation,
                                model.selectedResult, model.list()));
                      },
                    ),
                  ],
                  centerTitle: true,
                  title: const Text('SEARCH BY ID'),
                ),
                body: model.registeredList.isEmpty
                    ? Container()
                    : ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: Colors.lightGreen,
                            thickness: 2.0,
                          );
                        },
                        itemCount: model.registeredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () =>
                                model.addFile(model.registeredList[index]),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                  'ID/PassPort Number  :  ${model.registeredList[index].id.toString()}'),
                            ),
                            title: Row(
                              children: <Widget>[
                                Text(
                                    'Name : ${model.registeredList[index].name}   |  Surname : ${model.registeredList[index].surname}'),
                              ],
                            ),
                          );
                        },
                      )));
      });
    });
  }
}

class Search extends SearchDelegate {
  final BoxConstraints constraints;
  final Orientation orientation;
  String _selectedResult;
  final List<String> _listContructor;

  Search(this.constraints, this.orientation, this._selectedResult,
      this._listContructor);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        return Navigator.pop(context);
        //   return this._navigationServiceContructor;
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(constraints, orientation, _selectedResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    suggestionList.addAll(_listContructor
        .where((element) => element.contains(query.toLowerCase())));

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.lightGreen,
        );
      },
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            _selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}

class SearchResult extends StatelessWidget {
  final BoxConstraints constraints;
  final Orientation orientation;
  final String _selectedResult;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SearchResult(this.constraints, this.orientation, this._selectedResult);

  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional viewmodel
    // binding which will excute the builder again when notifyListeners is called.
    return ViewModelBuilder<SearchResultModel>.reactive(
        viewModelBuilder: () => SearchResultModel(),
        builder: (context, model, child) {
          model.indentifiedSearch(_selectedResult);
          return Scaffold(
            backgroundColor: Colors.lightGreen,
            body: Center(
              child: ListView.builder(
                itemCount: model.selectedSearchValueFromList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 6 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        const Text(
                          'Is this the right Patient?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                            height: 4 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        Text(
                            'ID / PassPort Number : ${model.selectedSearchValueFromList[index].id.toString()}'),
                        SizedBox(
                            height: 2.1 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        Text(
                            'Name : ${model.selectedSearchValueFromList[index].name}'),
                        SizedBox(
                            height: 2.1 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        Text(
                            'Surname : ${model.selectedSearchValueFromList[index].surname}'),
                        SizedBox(
                            height: 2.1 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Gender : '),
                            Text(model.selectedSearchValueFromList[index]
                                        .isMale ==
                                    true
                                ? 'Male'
                                : 'Female'),
                          ],
                        ),
                        SizedBox(
                            height: 4 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        const Text('Date and Time of registration'),
                        Text(model
                            .selectedSearchValueFromList[index].registration
                            .toLocal()
                            .toString()),
                        SizedBox(
                            height: 5.9 *
                                SizeConfig(constraints, orientation)
                                    .heightMultiplierr()),
                        ElevatedButton(
                          // color: Colors.grey,
                          onPressed: () async {
                            Person selectedSearch = Person(
                                id: model.selectedSearchValueFromList[index].id,
                                isMale: model
                                    .selectedSearchValueFromList[index].isMale,
                                name: model
                                    .selectedSearchValueFromList[index].name,
                                registration: model
                                    .selectedSearchValueFromList[index]
                                    .registration,
                                surname: model
                                    .selectedSearchValueFromList[index]
                                    .surname);

                            model.fileListViewArguments(
                                model.selectedSearchValueFromList[index].id,
                                model.selectedSearchValueFromList[index].name,
                                selectedSearch);
                            model.fileList();
                          },
                          child: const Text('click to see record'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
