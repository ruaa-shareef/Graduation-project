import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/components/drawer.dart';

class UpdateTotalAttendance extends StatefulWidget {
  final int lecturerId;
  UpdateTotalAttendance({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<UpdateTotalAttendance> createState() => TUpdateTotalAttendanceState();
}

class TUpdateTotalAttendanceState extends State<UpdateTotalAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Total Attendance",
          style: GoogleFonts.roboto(
            // fontSize: 60,
          ),
          // style: GoogleFonts.lato(),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/ppu-logo.png",
          ),
        ),
      ),
      endDrawer: DrawerPage(lecturerId: widget.lecturerId,),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Flutter",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff622545),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                Text(
                  "Section 1",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          //////////////////////////////
          SizedBox(height: 10),
          //////////////////////////////
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    cursorWidth: 1, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: Text('1'),
                title: Text("Assel"),
                trailing: Container(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // controller: driverNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color(0xff622545),
                        ),
                        //Change color to Color(0xff73a16a)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text("Save Update"),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}