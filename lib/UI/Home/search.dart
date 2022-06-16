import 'package:flutter/material.dart';
import 'package:sanchari/UI/googleMapScreen.dart';
import 'package:sanchari/constants.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);
  get _busNumberController => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Card(
                child: TextField(
                  controller: _busNumberController,
                  autofocus: false,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Bus Number",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                      filled: true,
                      fillColor:
                          Theme.of(context).brightness == Brightness.light
                              ? kLightPrimaryColor
                              : kDarkSecondaryColor,
                      border: InputBorder.none),
                ),
                elevation: 5,
              )),
          Expanded(
            child: Card(
                elevation: 8,
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.history,
                          size: 30.0,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Recent",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(
                          color: Colors.black,
                          height: 20,
                        )),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: ListTile(
                                leading: Container(
                                  height: double.infinity,
                                  child: Icon(
                                    Icons.directions_bus_rounded,
                                    size: 40.0,
                                  ),
                                ),
                                title: Text("KA - 13 F-3456"),
                                subtitle: Text("Hassan - Sakleshpur"),
                                trailing: Container(
                                  height: double.infinity,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GoogleMapScreen()));
                                    },
                                    icon: Icon(Icons.directions),
                                    color: Colors.blue,
                                    iconSize: 40.0,
                                  ),
                                ),
                              ),
                              elevation: 10,
                              margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
                            );
                          }),
                    )
                  ],
                )),
          )
        ]));
  }
}