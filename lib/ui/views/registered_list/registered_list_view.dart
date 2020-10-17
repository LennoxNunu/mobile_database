import 'package:flutter/material.dart';
import 'package:mobile_database/ui/views/registered_list/registeredlist_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RegisteredListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisteredListViewModel>.reactive(
        viewModelBuilder: () => RegisteredListViewModel(),
        builder: (context, model, _) => Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: Search(model.selectedResult, model.list()));
                  },
                ),
              ],
              centerTitle: true,
              title: Text('SEARCH BY ID'),
            ),
            body: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.lightGreen,
                  thickness: 2.0,
                );
              },
              itemCount: model.registeredList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () => model.addFile(model.registeredList[index]),
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
  }
}

class Search extends SearchDelegate {
  String _selectedResult;
  final List<String> _listContructor;

  Search(this._selectedResult, this._listContructor);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        return Navigator.pop(context);
        //   return this._navigationServiceContructor;
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: SearchResult(this._selectedResult),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    suggestionList.addAll(this
        ._listContructor
        .where((element) => element.contains(query.toLowerCase())));

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.lightGreen,
        );
      },
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            this._selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}

class SearchResult extends StatelessWidget {
  final String _selectedResult;

  const SearchResult(this._selectedResult);

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
                          height: 30.0,
                        ),
                        Text(
                          'Is this the right Patient?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                            'ID / PassPort Number : ${model.selectedSearchValueFromList[index].id.toString()}'),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                            'Name : ${model.selectedSearchValueFromList[index].name}'),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                            'Surname : ${model.selectedSearchValueFromList[index].surname}'),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Gender : '),
                            Text(model.selectedSearchValueFromList[index]
                                        .isMale ==
                                    true
                                ? 'Male'
                                : 'Female'),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text('Date and Time of registration'),
                        Text(model
                            .selectedSearchValueFromList[index].registration
                            .toLocal()
                            .toString()),
                        SizedBox(
                          height: 28.0,
                        ),
                        FlatButton(
                          color: Colors.grey,
                          onPressed: () async {
                            await model.fileListViewArguments(
                                model.selectedSearchValueFromList[index].id,
                                model.selectedSearchValueFromList[index].name,
                                model.selectedSearchValueFromList[index]);
                            model.fileList();
                          },
                          child: Text('click to see record'),
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
