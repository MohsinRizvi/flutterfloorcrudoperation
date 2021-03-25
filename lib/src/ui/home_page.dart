import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/src/dao/todo_dao.dart';
import 'package:todolist/src/database/app_database.dart';
import 'package:todolist/src/model/todo.dart';

import 'add_todo.dart';

/// Created by Jai on 14,May,2020

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  bool ckValue = false;
  TodoDao _todoDao;
  List<Todo> todoList = [];
  List<bool> cbList = [];

  //  List<bool> sizeOfList = ;
  final database = $FloorAppDatabase.databaseBuilder('tododatabase.db').build();

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int a = 0, b = 1;

  TextEditingController _textEditingController = new TextEditingController();
  final formstate = new GlobalKey<FormState>();
  Widget ShowCard() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              child: Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Form(
                  key: formstate,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Interviewee Details",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[600],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        padding:
                            EdgeInsets.only(right: 10, left: 10, bottom: 5),
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          //  color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.purple)),
                          padding: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                          color: Colors.white,
                          onPressed: () {},
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _textEditingController,
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(top: 5),
                                  border: InputBorder.none,
                                  // labelText: "Interviewee Name",
                                  hintText: "Interviewee Name ",
                                ),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Enter Name ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(right: 10, left: 10, bottom: 5),
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          //  color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.purple)),
                          padding: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                          color: Colors.white,
                          onPressed: () {},
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                "AKDN OFFICER",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  // fontFamily: '',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(10),
                      //   child: Text(
                      //     "AKDN OFFICER",
                      //     style: TextStyle(
                      //         fontSize: 18,
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                  // fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => _saveCall(),
                            // onPressed: () {
                            //   if (formstate.currentState.validate()) {
                            //     formstate.currentState.save();
                            //     Navigator.pop(context);
                            //   }
                            // },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  // fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (formstate.currentState.validate()) {
                                formstate.currentState.save();
                                Navigator.pop(context);
                              }
                            },
                            // onPressed: () => _saveCall(),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  _saveCall() {
    setState(() {
      // counter++;
      a++;
    });
    final database =
        $FloorAppDatabase.databaseBuilder('tododatabase.db').build();
    database.then((onValu) {
      onValu.todoDao.getMaxTodo().then((onValue) {
        int id = 1;
        if (onValue != null) {
          id = onValue.id + 1;
        }
        onValu.todoDao.insertTodo(Todo(id, _textEditingController.value.text,
            DateFormat('dd-MM-yyyy kk:mm').format(DateTime.now()), 'mm'));
      });
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // print debug
    // get dao
    debugPrint('build call');
    return Material(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.delete),
        //       onPressed: () {
        //         List<Todo> listSelectedDat = widget.todoList
        //             .where((test) => test.isSelect == true)
        //             .toList();
        //         widget._todoDao.deleteAll(listSelectedDat).then((onValue) {
        //           debugPrint('deleted values :${onValue}');
        //           setState(() {});
        //         });
        //       },
        //     )
        //   ],
        // ),
        appBar: AppBar(
          title: Text(
            'Assesment Two',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
          // centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 30.0,
          titleSpacing: 70.0,
          // toolbarOpacity: 0.5,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.blue,
              ),
              onPressed: () {
                ShowCard();
              },
            )
          ],
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<TodoDao>(
                    future: _calltheStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<TodoDao> snapshot) {
                      if (!snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.none) {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return StreamBuilder<List<Todo>>(
                            stream: snapshot.data.fetchStreamData(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData ||
                                  snapshot.connectionState ==
                                      ConnectionState.none) {
                                return Container(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                if (widget.todoList.length !=
                                    snapshot.data.length) {
                                  widget.todoList = snapshot.data;
                                }

                                if (snapshot.data.length == 0) {
                                  return Center(
                                    child: Text(
                                      'No Data Found',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: '',
                                        // fontStyle: FontStyle.italic
                                      ),
                                    ),
                                  );
                                }

                                return Expanded(
                                  child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return assesments2button(
                                          Icons.home,
                                          '${snapshot.data[index].task}',
                                          () {
                                            _selectedDetele(
                                                snapshot.data[index].id);
                                          },
                                          "   ${snapshot.data[index].time}",
                                          '$a',
                                        );
                                        // return Card(
                                        //     child: ListTile(
                                        //   leading: Checkbox(
                                        //     value:
                                        //         widget.todoList[index].isSelect,
                                        //     onChanged: (bool value) {
                                        //       setState(() {
                                        //         widget.todoList[index]
                                        //             .isSelect = value;
                                        //       });
                                        //     },
                                        //   ),
                                        //   trailing: GestureDetector(
                                        //     onTap: () {
                                        //       _selectedDetele(
                                        //           snapshot.data[index].id);
                                        //     },
                                        //     child: Icon(Icons.delete),
                                        //   ),
                                        //   title: Row(
                                        //     children: [
                                        //       Text(
                                        //         '${snapshot.data[index].task}',
                                        //         // '$counter',
                                        //         maxLines: 1,
                                        //       ),
                                        //       // Text(
                                        //       //   // '${snapshot.data[index].task}',
                                        //       //   '$counter',
                                        //       //   maxLines: 1,
                                        //       // ),
                                        //     ],
                                        //   ),
                                        //   subtitle: Text(
                                        //     '${snapshot.data[index].time}',
                                        //     style: TextStyle(fontSize: 10),
                                        //   ),
                                        // ));
                                      }),
                                );
                              }
                            });
                      }
                    }),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            ShowCard();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add, color: Colors.white),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  // _openAddScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddTodo()),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    final database =
        $FloorAppDatabase.databaseBuilder('healthassesmentdatabase.db').build();
    database.then((onValueP) {
      setState(() {
        widget._todoDao = onValueP.todoDao;
      });
    });
    debugPrint('call in init');
  }

  Future<TodoDao> _calltheStream() async {
    AppDatabase appDatabase = await widget.database;
    widget._todoDao = appDatabase.todoDao;
    return appDatabase.todoDao;
  }

  void _selectedDetele(int id) {
    widget._todoDao.deleteTodo(id);
    setState(() {});
  }
}
