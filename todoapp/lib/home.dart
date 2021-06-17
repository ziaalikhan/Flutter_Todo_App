import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var output = "";

  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(top: 15),
                  child: ListTile(
                    title: Text(
                      "${lst[index]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Container(
                      width: 70,
                     
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Item'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "What to Edit",
                                            labelText: 'Lets Edit'),
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          (5)),
                                                ),
                                                padding: EdgeInsets.all(10),
                                                textStyle: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Icon(Icons.done))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Item'),
                  content: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "What to Add",
                        labelText: 'Todo App'),
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((5)),
                            ),
                            padding: EdgeInsets.all(10),
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text('+'))
                  ],
                );
              });
        },
        child: Text(
          '+',
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
