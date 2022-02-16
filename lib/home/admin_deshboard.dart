import 'dart:async';
import 'dart:convert';
import 'package:carelan/model/deshboardmodel/all_user.dart';
import 'package:carelan/model/deshboardmodel/approverejectmodel.dart';
import 'package:carelan/service/deshboard/approve_reject_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo1.jpg',
          height: 120,
          width: 120,
          fit: BoxFit.scaleDown,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.pink),
        elevation: 0.5,
      ),
      body: AdminUi(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminUi extends StatefulWidget {
  const AdminUi({Key? key}) : super(key: key);

  @override
  _AdminUiState createState() => _AdminUiState();
}

class _AdminUiState extends State<AdminUi> {
  //Widget AdminUi(){
  //create stream
  StreamController<AllUser> _streamController = StreamController();
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // A Timer method that run every 3 seconds
    //Timer.periodic(Duration(seconds: 3), (timer) {
    getAllUser();
    //});
  }

  // a future method that fetch data from API
  Future<void> getAllUser() async {
    String url = 'https://www.carelan.in/api/get-all-user-profile';
    http.Response response = await http.get(Uri.parse(url));
    final databody = json.decode(response.body);
    AllUser dataModel = new AllUser.fromJson(databody);
    return _streamController.sink.add(dataModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(greeting() + '\nAdmin',
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total leads',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                      Text(
                        '32',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          //color: Colors.pinkAccent
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //ApproveRejectUi(),
          // getAllUser();
          Expanded(
              child: StreamBuilder<AllUser>(
                stream: _streamController.stream,
                builder: (context, snapdata) {
              var count = snapdata.data?.userDetails!.length;
              print(count);
              //print(snapdata.data!.userDetails![0]);
              AllUser datalist = snapdata.data!;

              //return BuildCoinWidget(snapdata.data!, count);
              return ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  var data = datalist.userDetails
                      ?.map((e) => e.toJson())
                      .toList()[index];
                  var datas = data!.values.toList();

                  return Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        height: 240,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.only(top: 6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            datas[3].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pinkAccent),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Email: ' + datas[4].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Mobile : ' + datas[5].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Address : ' + datas[6].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        //color: Colors.pink,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: RaisedButton(
                                                textColor: Colors.white,
                                                color: Colors.grey,
                                                child: Text('Reject'),
                                                onPressed: () {
                                                  rejectUser(
                                                    mobile: '9897424156',
                                                  ).then((value) {
                                                    RejectUser reject_user =
                                                        value;
                                                    if (reject_user.status ==
                                                        1) {
                                                      print('profile apprved');
                                                    }
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                            content: Text(
                                                      reject_user.msg ?? "",
                                                    )));
                                                  });
                                                }),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                              child: RaisedButton(
                                                  textColor: Colors.white,
                                                  child: Text('Approved'),
                                                  color: Colors.pinkAccent,
                                                  onPressed: () {
                                                    approveUser(
                                                      mobile: '9897424156',
                                                    ).then((value) {
                                                      ApproveUser approve_user =
                                                          value;
                                                      if (approve_user.status ==
                                                          1) {
                                                        print(
                                                            'profile apprved');
                                                      }
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                                  content: Text(
                                                        approve_user.msg ?? "",
                                                      )));
                                                    });
                                                  })),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17)
      return 'Good Afternoon';
    else
      return 'Good Evening';
  }
}
