// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:todolist/src/database/app_database.dart';
// import 'package:todolist/src/model/todo.dart';

// /// Created by Jai on 15,May,2020
// class AddTodo extends StatefulWidget {
//   TextEditingController _textEditingController = new TextEditingController();

//   @override
//   State<StatefulWidget> createState() => _addTodoData();
// }

// class _addTodoData extends State<AddTodo> {
//   TextEditingController _textEditingController = new TextEditingController();
//   final formstate = new GlobalKey<FormState>();
//   Widget ShowCard() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Center(
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Form(
//                 key: formstate,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Text(
//                       "Interviewee Details",
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Material(
//                       elevation: 6.0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _textEditingController,
//                         onEditingComplete: () =>
//                             FocusScope.of(context).nextFocus(),
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(top: 14),
//                           border: InputBorder.none,
//                           labelText: "Interviewee Name",
//                           hintText: "Interviewee Name ",
//                         ),
//                         validator: (val) {
//                           if (val.isEmpty) {
//                             return 'Enter Name ';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "AKDN OFFICER",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         TextButton(
//                           child: const Text('Save'),
//                           // onPressed: () {
//                           //   // if (formstate.currentState.validate()) {
//                           //   //   _saveCall;
//                           //   //   Navigator.pop(context);
//                           //   // }
//                           // },
//                           onPressed: _saveCall(),
//                         ),
//                         const SizedBox(width: 8),
//                         TextButton(
//                           child: const Text('Continue'),
//                           onPressed: () {
//                             if (formstate.currentState.validate()) {
//                               formstate.currentState.save();
//                               Navigator.pop(context);
//                             }
//                           },
//                         ),
//                         const SizedBox(width: 8),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add TODO'),
//       ),
//       body: ShowCard(),
//       //   body: ListView(
//       //     children: <Widget>[
//       //       Container(
//       //         height: 100,
//       //         margin: EdgeInsets.all(10),
//       //         child: TextField(
//       //           maxLines: 5,
//       //           controller: widget._textEditingController,
//       //           decoration: InputDecoration(
//       //               focusedBorder: OutlineInputBorder(
//       //                   borderSide: BorderSide(color: Colors.grey)),
//       //               enabledBorder: OutlineInputBorder(
//       //                   borderSide: BorderSide(color: Colors.grey))),
//       //           onTap: () {},
//       //         ),
//       //       ),
//       //       Container(
//       //         margin: EdgeInsets.all(10),
//       //         child: RaisedButton(
//       //           padding: EdgeInsets.all(10),
//       //           onPressed: () => _saveCall(),
//       //           child: Text('Save'),
//       //         ),
//       //       ),
//       //       Container(
//       //         margin: EdgeInsets.all(10),
//       //         child: RaisedButton(
//       //           padding: EdgeInsets.all(10),
//       //           onPressed: () => _saveBunkCall(),
//       //           child: Text('Generate Bulk 100 Record'),
//       //         ),
//       //       )
//       //     ],
//       //   ),
//     );
//   }

//   _saveCall() {
//     final database =
//         $FloorAppDatabase.databaseBuilder('tododatabase.db').build();
//     database.then((onValu) {
//       onValu.todoDao.getMaxTodo().then((onValue) {
//         int id = 1;
//         if (onValue != null) {
//           id = onValue.id + 1;
//         }
//         onValu.todoDao.insertTodo(Todo(
//             id,
//             widget._textEditingController.value.text,
//             DateFormat('dd-mm-yyyy kk:mm').format(DateTime.now()),
//             'mm'));
//       });
//     });
//     Navigator.pop(context);
//   }

//   _saveBunkCall() {
//     // add 100 records
//     final database =
//         $FloorAppDatabase.databaseBuilder('tododatabase.db').build();
//     database.then((onValu) {
//       onValu.todoDao.getMaxTodo().then((onValue) {
//         int id = 1;
//         if (onValue != null) {
//           id = onValue.id + 1;
//         }
//         List<Todo> listBunkData = [];
//         for (int i = id; i < id + 100; i++) {
//           listBunkData.add(Todo(i, i.toString(),
//               DateFormat('dd-mm-yyyy kk:mm').format(DateTime.now()), ""));
//         }
//         onValu.todoDao.insertAllTodo(listBunkData);
//       });
//     });
//     Navigator.pop(context);
//   }
// }
import "package:flutter/material.dart";

class assesments2button extends StatelessWidget {
  final IconData icn;
  final String name, date, score;
  final Function onPress;
  int n = 150;
  add() {
    for (int a = 0; a < n; a++) {
      Text("Health Officer $a");
    }
  }

  assesments2button(this.icn, this.name, this.onPress, this.date, this.score);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      child: RaisedButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue)),
          padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
          onPressed: onPress,
          child: Column(
            children: [
              Column(
                children: [],
              ),
              // Column(children: [

              // ],),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topLeft,
                            colors: [
                              Colors.blue,
                              Colors.blue,
                            ])),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Icon(
                        icn,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12.0, bottom: 12, left: 12),
                    child: Text(
                      name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        // fontFamily: '',
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    // padding: const EdgeInsets.only(left: 150),
                    margin: EdgeInsets.only(left: 130),
                    child: GestureDetector(
                      onTap: onPress,
                      child: Icon(
                        Icons.delete,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        date.toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // fontFamily: '',
                          // fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        // top: 10.0,
                        left: 65,
                      ),
                      child: Text(
                        score.toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          // fontFamily: '',
                          // fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
