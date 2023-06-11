import 'package:flutter/material.dart';

import 'label.dart';

class Work_hour extends StatefulWidget {
  const Work_hour({super.key});

  @override
  State<Work_hour> createState() => _Work_hourState();
}

class _Work_hourState extends State<Work_hour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 249, 246),
        ),
        body: Container(
          width: 800,
          height: 800,
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 20),
                    LabelTxt(text: "Work Hours", size: 30, fn: FontWeight.w600),
                    SizedBox(height: 20),
                    Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        leading: Icon(Icons.lock_clock, size: 60),
                        title: LabelTxt(
                          text: "Start Time",
                          size: 16,
                          color: Colors.black,
                          fn: FontWeight.w600,
                        ),
                        subtitle: Text('8:00:00'),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                    ),
                    Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        leading: Icon(Icons.lock_clock, size: 60),
                        title: LabelTxt(
                          text: "End Time",
                          size: 16,
                          color: Colors.black,
                          fn: FontWeight.w600,
                        ),
                        subtitle: Text('17:00:00'),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                    ),
                    Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        leading: Icon(Icons.breakfast_dining, size: 60),
                        title: LabelTxt(
                          text: "Break",
                          size: 16,
                          color: Colors.black,
                          fn: FontWeight.w600,
                        ),
                        subtitle: Text('12:00:00'),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                    ),
                    Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        leading: Icon(Icons.lock_clock, size: 60),
                        title: LabelTxt(
                          text: "Start Time",
                          size: 16,
                          color: Colors.black,
                          fn: FontWeight.w600,
                        ),
                        subtitle: Text('12:30:00'),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
