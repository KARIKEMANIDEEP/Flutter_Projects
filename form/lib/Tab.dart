import 'package:flutter/material.dart';


class Tab_View extends StatefulWidget {
  const Tab_View({super.key});

  @override
  State<Tab_View> createState() => _Tab_ViewState();
}

class _Tab_ViewState extends State<Tab_View> {

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.grey,
          padding: EdgeInsets.all(16),
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text("First Bottom Sheet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text("TEXT"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("EXIT"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TAB"),

      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              tabs: [
                Tab(text: "Alert Box"),
                Tab(text: "Bottom Sheet"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Alert Box"),
                            content: Text("message!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Perform action here
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Alert"),
                  ),
                  TextButton(
                    onPressed: () {
                      showBottomSheet(context);
                    },
                    child: Text("BottomSheet"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );    const Placeholder();
  }
}