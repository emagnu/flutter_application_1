//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import 'finished_page.dart';
import 'first_page.dart';
import 'second_page.dart';
//  PARTS
//  PROVIDERS
//  //  //   ///

class FormPage extends ConsumerStatefulWidget {
  const FormPage({super.key});

  @override
  ConsumerState<FormPage> createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
            // Container(
            //   child: Text("hed"),
            // ),
            FormFirstPage(
              nextPage: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              prevPage: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
            FormSecondPage(
              nextPage: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              prevPage: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
            const FinishedPage()
          ],
        ),
      ),
    ));
  }
}
