//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//  Import FILES
//  PARTS
//  PROVIDERS
//  //  //   ///

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page - Temporary'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed('form');
                },
                child: const Text("Go to Form"),
              ),
              // ProfileList(),
            ],
          ),
        ));
  }
}
