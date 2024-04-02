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

//2nd Page

class FormSecondPage extends ConsumerStatefulWidget {
  final VoidCallback nextPage;
  final VoidCallback prevPage;
  const FormSecondPage(
      {super.key, required this.nextPage, required this.prevPage});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSecondPageState();
}

class _FormSecondPageState extends ConsumerState<FormSecondPage> {
  GlobalKey<FormBuilderState> formKey = GlobalKey();

  List<String> occupationList = [
    'Delivery Drivers',
    'Rideshare or Uber Drivers',
    'Commercial Drivers',
    'Emergency Services Personnel',
    'Medical Professionals',
    'Teachers and Educators',
    'Military Personnel',
    'Engineers and Scientists',
    'Lawyers and Accountants',
    'Agricultural Workers',
    'Entertainment Industry Professionals',
    'Sales Representatives',
    'Construction Workers',
    'Public Service Employees',
    'Athletes',
    'Others',
  ];
  bool occupationOthers = false;

  // late Get2ndFormInfo map;

  @override
  Widget build(BuildContext context) {
    // map = ref.watch(get2ndFormInfoProvider.notifier);

    return FormBuilder(
      key: formKey,
      // initialValue: map.getState(),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FormBuilderDropdown(
                name: 'occupation',
                onChanged: (value) {
                  if (value == "Others") {
                    setState(() {
                      occupationOthers = true;
                    });
                  } else {
                    setState(() {
                      occupationOthers = false;
                    });
                  }
                },
                items: occupationList
                    .map((use) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: use,
                          child: Text(
                            use,
                          ),
                        ))
                    .toList(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Occupation")),
              ),
              const SizedBox(
                height: 50,
              ),
              Visibility(
                visible: occupationOthers == true ? true : false,
                child: FormBuilderTextField(
                  name: 'occupationOthers',
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Others")),
                  validator: FormBuilderValidators.compose(dropDownValidator()),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FormBuilderTextField(
                name: 'height',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Height")),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              FormBuilderTextField(
                name: 'weight',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Weight")),
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
                          formKey.currentState!.saveAndValidate();
                          // ref //Set the Provider the state
                          //     .read(get2ndFormInfoProvider.notifier)
                          //     .setInfo(formKey.currentState!.value);
                          // ref
                          //     .read(getProfileListProvider.notifier)
                          //     .addPersons()

                          widget.nextPage();
                        } else {
                          formKey.currentState!.validate();
                          //If got error, it will show what is the error
                        }
                      },
                      child: const Text('Submit')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String? Function(String?)> dropDownValidator() {
    if (occupationOthers) {
      return [
        FormBuilderValidators.required(),
      ];
    } else {
      return [];
    }
  }
}
