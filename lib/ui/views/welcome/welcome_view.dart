import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mobile_database/ui/views/welcome/welcome_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional viewmodel
    // binding which will excute the builder again when notifyListeners is called.
    return ViewModelBuilder<WelcomeViewModel>.nonReactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: ListView(children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Greeting(),
            SizedBox(
              height: 220.0,
              width: 340.0,
              child: Image(image: AssetImage('assets/home.jpg')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RaisedButton(
                    onPressed: () => model.newPatient(),
                    child: Text('New Patient'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FlatButton(
                    onPressed: () => model.oldPatient(),
                    child: Text(
                      'Old Patient',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      width: 200.0,
      height: 50.0,
      child: Center(
        child: FadeAnimatedTextKit(
          text: ["Hello Doctor!", "Hello Nurse!"],
          textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          alignment: AlignmentDirectional.topStart,
        ),
      ),
    ));
  }
}
