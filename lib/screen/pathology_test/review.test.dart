import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/doctor/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/screen/pathology_test/available_test_hospital.dart';
import 'package:one_tap_health/utils.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TestReview extends StatefulWidget {
  const TestReview({Key? key}) : super(key: key);

  @override
  State<TestReview> createState() => _TestScreenState();
}
enum Fruit { Home , Hospital }
class _TestScreenState extends State<TestReview> {
  Fruit? _fruit = Fruit.Home;
  TextEditingController dueDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Details"),
        centerTitle: true,
      ),
      bottomNavigationBar:      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),

          child: Center(
            child: Text(
              "Proceed",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Card(
                  child: Container(
                    child: Column(
                     children: [
                       ListTile(

                         title: Text("02, Aug, 2023"),
                         trailing: Icon(Icons.more_vert),
                       ),

                       ListTile(
                         leading: Container(
                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                             image: DecorationImage(

                                 image: AssetImage(

                                   'images/test/thyroid.png',
                                 )),
                           ),
                         ),
                         title: Text("Thyroid"),
                         subtitle: Text("Lab Test"),
                         trailing: Text("205.00tk"),
                       ),
                       Divider(),
                       ListTile(

                         title: Text("Tax"),
                         trailing:  Text("209 tk", style: TextStyle(
                             fontWeight: FontWeight.normal
                         ),),
                       ),
                       ListTile(

                         title: Text("Payable"),
                         trailing:  Text("209 tk", style: TextStyle(
                             fontWeight: FontWeight.normal
                         ),),
                       ),
                       ListTile(

                         title: Text("Sub Total"),
                         trailing:  Text("209 tk", style: TextStyle(
                             fontWeight: FontWeight.normal
                         ),),
                       ),
                       ListTile(

                         title: Text("Grand Total", style: TextStyle(
                           fontWeight: FontWeight.bold
                         ),),
                         trailing:  Text("209 tk", style: TextStyle(
                             fontWeight: FontWeight.bold
                         ),),
                       ),


                     ],
                    ),
                  ),
                ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Beneficiary Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
SizedBox(height: 20,),
                          Text("Name", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),),

                          Text("Mr. Hasan", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),),
                          SizedBox(height: 20,),
                          Text("Address", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),),
                          Text("Jessore, kazipara bazar", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),),


                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Collection Date & Time", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: borderColor, width: 1),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10.0))),
                  child: TextFormField(
                    controller: dueDateController,
                    readOnly: true,
                    onTap: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours
                                    .toString());
                          }, onConfirm: (date) {
                            String myDate = DateTime(
                                date.year, date.month, date.day)
                                .toString();
                            String myTime = DateTime(
                              date.hour,
                              date.minute,
                            ).toString();
                            print(
                                "my min and sec for due is $myTime");

                            dueDateController.text =
                                myDate.substring(0, 10);

                            print('confirm $date');
                          }, currentTime: DateTime.now());
                    },
                    onChanged: (value) {
                      // _productController.searchProduct(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefix: Container(
                        width: 20,
                      ),
                      hintText: 'Due Date',
                      suffixIcon: Icon(
                        Icons.date_range_rounded,
                        color: Color(0xFF7C8DB5),
                        size: 14,
                      ),
                      hintStyle: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Roboto',
                          color: tabBarUnSelectedColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Visit", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),

                Container(

                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Hospital'),
                        leading: Radio<Fruit>(
                          value: Fruit.Home,
                          groupValue: _fruit,
                          onChanged: (Fruit? value) {
                            setState(() {
                              _fruit = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Home'),
                        leading: Radio<Fruit>(
                          value: Fruit.Hospital,
                          groupValue: _fruit,
                          onChanged: (Fruit? value) {
                            setState(() {
                              _fruit = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),








              ]),
        ),
      ),
    );
  }
}
