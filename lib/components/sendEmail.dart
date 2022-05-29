import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendEmail extends StatefulWidget {
  SendEmail({Key? key}) : super(key: key);

  @override
  State<SendEmail> createState() => TSendEmailState();
}

class TSendEmailState extends State<SendEmail> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Email",
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
      // endDrawer: DrawerPage(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 18),
              // controller: driverNameController,
              cursorWidth: 1, cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Email Subject",
                labelStyle: GoogleFonts.roboto(
                  fontSize: 16.0,
                  color: Color(0xff622545),
                ),
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
                ),
              ),
            ),
          ),
          Container(
            child: CheckboxListTile(
              title: Text("All Student"), //    <-- label
              value: value,
              onChanged: (newValue) {
                setState(() {
                  this.value = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xff622545),
            ),
            // child: Checkbox(
            //         value: this.value,
            //         onChanged: (bool? value) {
            //           setState(() {
            //             this.value = value!;
            //           });
            //         },
            //       ),
          ),
         
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 18),
              // controller: driverNameController,
              cursorWidth: 1, cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "Email Subject",
                labelStyle: GoogleFonts.roboto(
                  fontSize: 16.0,
                  color: Color(0xff622545),
                ),
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
                ),
              ),
            ),
          ),
          //////////////////////////////
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              textAlign: TextAlign.left,
              minLines: 7,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorWidth: 1,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: "Email Body",
                labelStyle: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Color(0xff622545),
                ),
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
                label: Text("Save New Note"),
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