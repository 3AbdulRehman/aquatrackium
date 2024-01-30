import 'package:aquatrackium/controller/Real_Time_Database_value/RealTime_Temperature_value.dart';
import 'package:aquatrackium/controller/Real_Time_Database_value/Real_Time_PHLevel_Value.dart';
import 'package:aquatrackium/controller/Real_Time_Database_value/Real_Time_TDS_Value.dart';
import 'package:aquatrackium/controller/Real_Time_Database_value/Real_Time_Turbidity_value.dart';
import 'package:aquatrackium/view/widget/mycard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}


class _HomeState extends State<Home> {

  final Temperature temperature = Get.put(Temperature());
  final Turbidity turbidity= Get.put(Turbidity());
  final TDSVAlue tds = Get.put(TDSVAlue());
  final PHLEVEL ph = Get.put(PHLEVEL());

  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child('MotorValue');
  bool MotorValue = false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temperature.TemperatureValue();
    turbidity.turbidityValue();
    ph.phlevelValue();
    tds.tdsValue();
  }

  Widget build(BuildContext context) {


    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    double responsiveTextSize(double fontSize) {
      // Calculate responsive font size
      return fontSize * (w / 414); // 414 is a reference screen width
    }

    return  Scaffold(
        body: Container(
          height: double.infinity,
          width:  double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.cyanAccent.withOpacity(0.8),

                  Colors.indigoAccent,
                ]
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Image.asset("assets/images/drawer.png",
                        height: h*0.06,
                        width: w*0.12,
                      ),
                      Image.asset("assets/images/logo.png",
                        height: h*0.12,
                        width: w*0.28,
                      ),
                      GestureDetector(child: Icon(Icons.logout,size: 30,
                      ),
                        onTap: (){},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h*0.001,),
                Center(child: Text("Welcome to the AquaTrackium",style: TextStyle(fontSize: responsiveTextSize(25),fontWeight: FontWeight.bold,),)),
                SizedBox(height: h*0.020,),



                Row(
                  children: [
                    Center(
                      child: Image.asset("assets/images/doc.png",
                        height: h*0.35,
                        width: w*1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h*0.015,),
////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCard(child:
                      Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("Temperature",style: TextStyle(fontWeight: FontWeight.bold,fontSize: responsiveTextSize(20)),
                              ),
                            ),
                            SizedBox(height: h*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GetX<Temperature>(
                                      init: temperature,
                                      builder: (controller){
                                        return Text(controller.value.value,
                                          style: TextStyle(fontSize: responsiveTextSize(24)),);
                                      }
                                  ),

                                  Image.asset("assets/images/temperature.png",
                                    height: h*0.09,
                                    width: w*0.18,
                                  ),
                                ],
                              ),
                            )
                          ]
                      )
                      ),
                      MyCard(child:
                      Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("TDS Value",style: TextStyle(fontWeight: FontWeight.bold,fontSize: responsiveTextSize(20)),
                              ),
                            ),
                            SizedBox(height: h*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GetX<TDSVAlue>(
                                      init: tds,
                                      builder: (controller){
                                        return Text(controller.value.value,
                                          style: TextStyle(fontSize: responsiveTextSize(24)),);
                                      }
                                  ),
                                  Image.asset("assets/images/humidity.png",
                                    height: h*0.09,
                                    width: w*0.18,
                                  ),
                                ],
                              ),
                            )
                          ]
                      )
                      ),



                    ],
                  ),
                ),


                SizedBox(height: h*0.02,),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCard(child:
                      Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("PH Value",style: TextStyle(fontWeight: FontWeight.bold,fontSize: responsiveTextSize(20)),
                              ),
                            ),
                            SizedBox(height: h*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GetX<PHLEVEL>(
                                      init: ph,
                                      builder: (controller){
                                        return Text(controller.value.value,
                                          style: TextStyle(fontSize: responsiveTextSize(24)),);
                                      }
                                  ),
                                  Image.asset("assets/images/ph.png",
                                    height: h*0.09,
                                    width: w*0.18,
                                  ),
                                ],
                              ),
                            )
                          ]
                      )
                      ),
                      MyCard(child:
                      Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text("Turbidity",style: TextStyle(fontWeight: FontWeight.bold,fontSize: responsiveTextSize(20)),
                              ),
                            ),
                            SizedBox(height: h*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GetX<Turbidity>(
                                      init: turbidity,
                                      builder: (controller){
                                        return Text(controller.value.value,
                                          style: TextStyle(fontSize: responsiveTextSize(24)),);
                                      }
                                  ),
                                  Image.asset("assets/images/tds.png",
                                    height: h*0.09,
                                    width: w*0.18,
                                  ),
                                ],
                              ),
                            )
                          ]
                      )
                      ),






                    ],
                  ),
                ),

                SizedBox(height: h*0.002,),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red), // Change the color here
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(9.8), // Set this to 0.0
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      MotorValue = !MotorValue;
                      _updateDatabase();
                    });
                  },
                  child: Text(MotorValue ? 'Motor On' : 'Motor Off',style: TextStyle(color: Colors.white),),
                ),

              ],

            ),
          ),
        )
    );
  }
  void _updateDatabase() {
    int valueToWrite = MotorValue ? 1 : 0;
    _databaseReference.set(valueToWrite);
  }


}
