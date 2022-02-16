import 'package:flutter/material.dart';

class DoctorDeshboard extends StatefulWidget {
  const DoctorDeshboard({Key? key}) : super(key: key);

  @override
  _DoctorDeshboardState createState() => _DoctorDeshboardState();
}

class _DoctorDeshboardState extends State<DoctorDeshboard> {
  @override
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
          body: DoctorHome(context),
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

Widget DoctorHome(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildDoctorTiles(context, 'New Patient'),
              BuildDoctorTiles(context, 'Total Cases'),
              BuildDoctorTiles(context, 'Pending\nPayment')
            ],
          ),
        )
      ],
    ),
  );
}

Widget BuildDoctorTiles(BuildContext context, String title){
  return InkWell(
    child: Container(
      key: UniqueKey(),
      height: 150,
      width: 110,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          /** Positioned WIdget **/
          Positioned(
            top : 15.0,
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              maxRadius: 40,
              child: Text('\u{20B9}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  color: Colors.white
                ),
              ),
            ), //Icon
          ),
          Positioned(
            top: 100,
            child: Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),) //CircularAvatar
          ), //Positioned
        ], //<Widget>[]
      ),
    ),
    onTap: (){
      Navigator.pushNamed(context, '/addPatient');
      // Navigator.pushNamed(
      //     context, '/OtpScreen',
      //     arguments: _controller.text);
    },
  );
}
