import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mobile_database/constants/size_config.dart';
import 'package:mobile_database/ui/views/welcome/welcome_viewmodel.dart';
import 'package:stacked/stacked.dart';

// ignore: use_key_in_widget_constructors
class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
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
                  height: 1 *
                      SizeConfig(constraints, orientation).heightMultiplierr(),
                ),
                Greeting(constraints, orientation),
                SizedBox(
                  height: 35 *
                      SizeConfig(constraints, orientation).heightMultiplierr(),
                  width: 40 *
                      SizeConfig(constraints, orientation).widthMultiplierr(),
                  child: const Image(image: AssetImage('assets/home.jpg')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(3 *
                          SizeConfig(constraints, orientation)
                              .widthMultiplierr()),
                      child: ElevatedButton(
                        onPressed: () => model.newPatient(),
                        child: const Text('New Patient'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3 *
                          SizeConfig(constraints, orientation)
                              .widthMultiplierr()),
                      child: TextButton(
                        onPressed: () => model.oldPatient(),
                        child: const Text(
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
      });
    });
  }
}

// ignore: use_key_in_widget_constructors
class Greeting extends StatelessWidget {
  final BoxConstraints constraints;
  final Orientation orientation;

  // ignore: use_key_in_widget_constructors
  const Greeting(this.constraints, this.orientation);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8 * SizeConfig(constraints, orientation).heightMultiplierr(),
      width: 40 * SizeConfig(constraints, orientation).widthMultiplierr(),
      child: Center(
          child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText("Hello Doctor!"),
                  RotateAnimatedText("Hello Nurse!")
                ],
              ))),
    );
  }
}
