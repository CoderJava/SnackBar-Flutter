import 'package:flutter/material.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Show Alert Dialog"),
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Warning"),
                    content: Text("Are you sure want to delete?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("No"),
                        onPressed: () {
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("No tapped")));
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("Yes"),
                        onPressed: () {
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Yes tapped")));
                          Navigator.pop(context);
                          print("Yes tapped");
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
