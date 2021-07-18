import 'package:flutter/material.dart';
import 'package:insuranceapp/formplanpage.dart';

class ViewPlanPage extends StatefulWidget {
  @override
  _ViewPlanPageState createState() => _ViewPlanPageState();
}

class _ViewPlanPageState extends State<ViewPlanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // dynamic screenHeight = MediaQuery.of(context).size.height;
    // dynamic screenwidth = MediaQuery.of(context).size.width;
    //bottomnavigation bar
    int _currentIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Insurance App'),
        ),
      ),
      body: Center(
        child: Text('You have not added any new plan'),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.amber[400],
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPlanPage()),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'ADD PLAN',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                // SizedBox(
                //   height: 0.1,
                // ),
                Center(
                  child: Text(
                    '____________________',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
