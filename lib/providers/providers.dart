// //   ///
// //  Import LIBRARIES
// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// //  Import FILES
// import '../models/person.dart';
// //  PARTS
// part 'providers.g.dart';

// //  PROVIDERS
// //  --- GetProfileList
// @riverpod
// class GetProfileList extends _$GetProfileList {
//   @override
//   Future<List<Person>> build() async {
//     // Future<List<Person>> build() async{
//     List<Person> list = [];
//     final response =
//         await http.get(Uri.parse('http://localhost:5000/getPersons'));

//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       list = json.map((e) => Person.fromJson(e)).toList();
//     } else {
//       debugPrint("ERROR");
//     }
//   }

//   Future<void> addPersons() async {
//     var first = ref.read(get1stFormInfoProvider.notifier).state;
//     var second = ref.read(get2ndFormInfoProvider.notifier).state;
//     var occupation = "";
//     if (second['occupation'] != 'Others') {
//       occupation = second['occupation'];
//     } else {
//       occupation = second['occupationOthers'];
//     }

//     Map<String, dynamic> map = {
//       "personname": first['name'],
//       "age": first['age'],
//       "gender": first['gender'],
//       "occupation": occupation,
//       "height": second['height'],
//       "weight": second['height']
//     };

//     final response =
//         await http.post(Uri.parse('http://localhost:5000/addPersons'),
//             headers: {
//               HttpHeaders.contentTypeHeader: 'application/json',
//             },
//             body: json.encode(map));

//     if (response.statusCode == 200) {
//       ref.invalidateSelf();
//     } else {
//       print("error in adding");
//     }
//   }

//   getList() {
//     debugPrint("getProfileList: getList() called");
//     return state;
//   }
// }

// ///   --- TodoList
// @riverpod
// class TodoList extends _$TodoList {
//   @override
//   Future<List<Person>> build() async {
//     // The logic we previously had in our FutureProvider is now in the build method.
//     List<Person> list = [];
//     final response =
//         await http.get(Uri.parse('http://localhost:5000/getPersons'));
//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       list = json.map((e) => Person.fromJson(e)).toList();
//     } else {
//       print("ERROR");
//     }

//     return list;
//   }
// }

// //  ---  Get1stFormInfo
// @Riverpod(keepAlive: true)
// class Get1stFormInfo extends _$Get1stFormInfo {
//   @override
//   Map<String, dynamic> build() {
//     print("1st Map");
//     return {};
//   }

//   setInfo(Map<String, dynamic> newInfo) {
//     state = newInfo;
//     print("state $state");
//   }

//   Map<String, dynamic> getState() {
//     return state;
//   }
// }

// //  ---  Get2ndFormInfo
// @Riverpod(keepAlive: true)
// class Get2ndFormInfo extends _$Get2ndFormInfo {
//   @override
//   Map<String, dynamic> build() {
//     return {};
//   }

//   setInfo(Map<String, dynamic> newInfo) {
//     state = newInfo;
//     print("state $state");
//   }

//   Map<String, dynamic> getState() {
//     return state;
//   }
// }
// //  //  //   ///


