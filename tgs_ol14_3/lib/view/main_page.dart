import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tgsol143/model/saham.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Rudi Barus-20170801321-Hive DB"),),
        body: FutureBuilder(
          future: Hive.openBox("sahams"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Center(child: Text(snapshot.error),);
              else {
                var sahamsBox = Hive.box("sahams");
                if (sahamsBox.length == 0) {
                  sahamsBox.add(Saham("APPLE", 1));
                  sahamsBox.add(Saham("GOOGLE", 5));
                }
                return WatchBoxBuilder(
                  box: sahamsBox,
                  builder: (context, sahams) =>
                      Container(
                        margin: EdgeInsets.all(20),
                        child: ListView.builder(
                          itemCount: sahams.length,
                          itemBuilder: (context, index) {
                            Saham saham = sahams.getAt(index);
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white, boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(3, 3),
                                    blurRadius: 6),
                              ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Text(
                                      saham.name + "[" +
                                          saham.level.toString() + "]"),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.trending_up),
                                        color: Colors.green,
                                        onPressed: () {
                                          sahams.putAt(index, Saham(
                                              saham.name, saham.level + 1));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.content_copy),
                                        color: Colors.amber,
                                        onPressed: () {
                                          sahams.add(
                                              Saham(saham.name, saham.level));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          sahams.deleteAt(index);
                                        },
                                      )
                                    ],
                                  )
                                ],

                              ),
                            );
                          },
                        ),
                      ),
                );
              }
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        )
    );
  }
}