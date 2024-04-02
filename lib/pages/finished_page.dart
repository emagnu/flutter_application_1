//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
//  Import FILES
//  PARTS
//  PROVIDERS
//  //  //   ///

class FinishedPage extends ConsumerStatefulWidget {
  const FinishedPage({super.key});

  @override
  ConsumerState<FinishedPage> createState() => _FinishedPageState();
}

class _FinishedPageState extends ConsumerState<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('Temp - Finished Page');
    // return FutureBuilder(
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Text("ERROR");
    //     } else {
    //       return Center(
    //           child: Column(
    //         children: [
    //           Text("Added"),
    //           ElevatedButton(
    //               onPressed: () {
    //                 GoRouter.of(context).goNamed('home');
    //               },
    //               child: Text("Go back"))
    //         ],
    //       ));
    //     }
    //   },
    //   future: ref.read(getProfileListProvider.notifier).addPersons(),
    // );
  }
}
