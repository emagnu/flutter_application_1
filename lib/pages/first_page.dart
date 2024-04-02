//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
//  Import FILES
//  PARTS
//  PROVIDERS
//  //  //   ///

//1st Page

class FormFirstPage extends ConsumerStatefulWidget {
  final VoidCallback nextPage;
  final VoidCallback prevPage;
  const FormFirstPage(
      {super.key, required this.nextPage, required this.prevPage});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormFirstPageState();
}

class _FormFirstPageState extends ConsumerState<FormFirstPage> {
  GlobalKey<FormBuilderState> formKey = GlobalKey();

  List<String> genderList = ["Male", "Female", "Do not wish to say"];

  // late Get1stFormInfo map;

  @override
  Widget build(BuildContext context) {
    // map = ref.watch(get1stFormInfoProvider.notifier);

    return FormBuilder(
      key: formKey,
      // initialValue: map.getState(),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Name")),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              FormBuilderTextField(
                name: 'age',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Age")),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              FormBuilderRadioGroup(
                name: 'gender',
                wrapDirection: Axis.vertical,
                orientation: OptionsOrientation.vertical,
                decoration: const InputDecoration(border: InputBorder.none),
                options: genderList
                    .map((lang) => FormBuilderFieldOption(
                          value: lang,
                          child: Text(
                            lang,
                          ),
                        ))
                    .toList(growable: false),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        widget.prevPage();
                      },
                      child: const Text("Back")),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!
                            .isValid) //Check if it means the validation
                        {
                          formKey.currentState?.saveAndValidate();
                          // ref //Set the Provider the state
                          //     .read(get1stFormInfoProvider.notifier)
                          //     .setInfo(formKey.currentState!.value);
                          widget.nextPage();
                        } else {
                          formKey.currentState?.validate();
                          //If got error, it will show what is the error
                        }
                      },
                      child: const Text('Next Page')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
