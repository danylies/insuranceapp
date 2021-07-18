import 'package:flutter/material.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:insuranceapp/childcomplete.dart';

class FormPlanPage extends StatefulWidget {
  @override
  _FormPlanPageState createState() => _FormPlanPageState();
}

class _FormPlanPageState extends State<FormPlanPage> {
  final List<String> mainPlan = ['Product ABC', 'Product DEF', 'Product GHI'];
  List<bool> selectedPplan = [false, false, false];
  List<bool> childPlan = [false, false, false];
  Map jsonData = {
    "main_plan": '',
    "child_plan": ["", "", ""]
  };
  GroupController controller = GroupController();
  //final selectedItems = controller.selectedItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Insurance App'),
        ),
      ),
      body: Column(children: [
        mainplan(),
        childplan(),
        AddDependent(),
      ]),
      // bottomNavigationBar: Container(
      //   height: 60,
      //   color: Colors.amber[400],
      //   child: InkWell(
      //     onTap: () => print('tap on close'),
      //     child: Padding(
      //       padding: EdgeInsets.only(top: 20.0),
      //       child: Column(
      //         children: <Widget>[
      //           Center(
      //             child: Text(
      //               'Add Plan',
      //               textAlign: TextAlign.center,
      //               overflow: TextOverflow.ellipsis,
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Container mainplan() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Select Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 60, // card height
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mainPlan.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width:
                                150, //MediaQuery.of(context).size.width * 0.6,
                            child: Card(
                              color: selectedPplan[index]
                                  ? Colors.blue
                                  : Colors.white,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPplan[index] = true;
                                    jsonData['main_plan'] = mainPlan[index];
                                    // !selected_plan[index]
                                    //     ? selected_plan[index] = false
                                    //     : selected_plan[index] = true;
                                    // print(selected_plan);
                                  });
                                  // print(jsonData);
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    mainPlan[index],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                  )),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container childplan() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                // Container(
                //   alignment: Alignment.start,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //    children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Select Child Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setStateB) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: new Icon(childPlan[0]
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    title: new Text('Rider 1'),
                                    onTap: () {
                                      setStateB(() {
                                        // if (!childPlan[0]) {
                                        //   childPlan[0] = true;
                                        // }
                                        // print(childPlan);
                                        childPlan[0]
                                            ? childPlan[0] = false
                                            : childPlan[0] = true;
                                        jsonData['child_plan'][0] = 'rider 1';
                                        print(jsonData);
                                      });
                                      // Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(childPlan[1]
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    title: new Text('Rider 2'),
                                    onTap: () {
                                      setStateB(() {
                                        childPlan[1]
                                            ? childPlan[1] = false
                                            : childPlan[1] = true;
                                        jsonData['child_plan'][1] = 'rider 2';
                                        print(jsonData);
                                      });
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(childPlan[2]
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    title: new Text('Rider 3'),
                                    onTap: () {
                                      setStateB(() {
                                        childPlan[2]
                                            ? childPlan[2] = false
                                            : childPlan[2] = true;
                                        jsonData['child_plan'][2] = 'rider 3';
                                        print(jsonData);
                                      });
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                        top: 15,
                                        bottom: 15),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChildComplete(
                                                jsonData: jsonData),
                                          ),
                                        );
                                      },
                                      padding: EdgeInsets.only(
                                          left: 150,
                                          right: 150,
                                          top: 15,
                                          bottom: 15),
                                      color: Colors.grey,
                                      child: Text(
                                        '+Add Child Plan',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                          });
                    },
                    padding: EdgeInsets.only(
                        left: 150, right: 150, top: 15, bottom: 15),
                    color: Colors.grey,
                    child: Text(
                      '+Add Child Plan',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container AddDependent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                // Container(
                //   alignment: Alignment.start,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //    children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Add Dependant',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: new Icon(Icons.photo),
                                  title: new Text('Rider 1'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.music_note),
                                  title: new Text('Rider 2'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.videocam),
                                  title: new Text('Rider 3'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.only(
                        left: 150, right: 150, top: 15, bottom: 15),
                    color: Colors.grey,
                    child: Text(
                      '+Add Child Plan',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
